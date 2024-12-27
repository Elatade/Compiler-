
# Lexical Analyzer for C Code Using Flex

This Assignment the creation of a **Lexical Analyzer** using **Flex** (a lexical analyzer generator) to analyze C code containing `if` conditions and `for` loops. The lexical analyzer breaks down the C code into various tokens such as keywords, operators, identifiers, literals, and punctuation.

## Project Overview

The main goal of this project is to analyze the following sample C code:

```c
int main() {
    int x = 10;
    for (int i = 0; i < x; i++) {
        if (i % 2 == 0) {
            printf("%d is even\\n", i);
        }
    }
    return 10;
}
```

We use **Flex** to identify and classify different tokens in the C program such as keywords (`int`, `if`, `for`, etc.), operators (`=`, `+`, `*`, etc.), literals (`10`, `x`, `i`), punctuation (`;`, `{`, `}`, `(`, etc.), and identifiers (e.g., function names like `main` and `printf`).

### Expected Output

When you run the lexical analyzer, it will output the tokens from the sample C code, for example:

```
Keyword: int
Identifier: main
Punctuation: (
Punctuation: )
Punctuation: {
Keyword: int
Identifier: x
Operator: =
Literal: 10
Punctuation: ;
Keyword: for
Punctuation: (
Keyword: int
Identifier: i
Operator: =
Literal: 0
Punctuation: ;
Operator: <
Identifier: x
Punctuation: ;
Operator: i
Operator: ++
Punctuation: )
Punctuation: {
Keyword: if
Punctuation: (
Identifier: i
Operator: %
Literal: 2
Operator: ==
Literal: 0
Punctuation: )
Punctuation: {
Identifier: printf
Punctuation: (
String: "%d is even\\n"
Punctuation: ,
Identifier: i
Punctuation: )
Punctuation: ;
Punctuation: }
Punctuation: }
Keyword: return
Literal: 10
Punctuation: ;
Punctuation: }
```

## Steps to Run the Code

### 1. Install Flex and GCC (Linux/MacOS/Windows)

#### For Linux/MacOS:
- Install **Flex** and **GCC** if you don't have them installed:
  ```bash
  sudo apt install flex gcc
  ```

#### For Windows:
- Use **Windows Subsystem for Linux (WSL)** or **MinGW** to install **Flex** and **GCC**. Follow the steps [here](https://www.gnu.org/software/flex/) to install Flex.

### 2. Clone the Repository

Clone the project repository to your local machine:

```bash
git clone https://github.com/<your-github-username>/lexical-analyzer-c-code.git
cd lexical-analyzer-c-code
```

### 3. Create Your Flex Source Code

Create a file named `group_3.l` and paste the following Flex code into it:

```c
%{
#include <stdio.h>
int yywrap(void) { return 1; } // Correct yywrap definition
%}

%%
"if"          { printf("Keyword: if\\n"); }
"for"         { printf("Keyword: for\\n"); }
"int"         { printf("Keyword: int\\n"); }
"return"      { printf("Keyword: return\\n"); }
[0-9]+        { printf("Literal: %s\\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\\n", yytext); }
"=="|"!="|"<="|">="|"<"|">" { printf("Operator: %s\\n", yytext); }
"="|"+"|"-"|"*"|"/"         { printf("Operator: %s\\n", yytext); }
";"|","|"("|")"|"{"|"}"     { printf("Punctuation: %s\\n", yytext); }
[ \\t\\n]+    { /* Ignore whitespace */ }
.             { printf("Unknown token: %s\\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
```

### 4. Compile the Flex Code

In your terminal, navigate to the folder containing the `group_3.l` file, and run the following commands:

1. **Generate Lexical Analyzer:**

   ```bash
   flex group_3.l
   ```

   This will generate a C source file `lex.yy.c`.

2. **Compile the C Source File:**

   Run the following command to compile the generated C file using **GCC**:

   ```bash
   gcc lex.yy.c -o GROUP
   ```

   This will create an executable named `GROUP`.

### 5. Create the C Test Code

Create a file named `Sample_C_code.c` and paste the following C code into it:

```c
int main() {
    int x = 10;
    for (int i = 0; i < x; i++) {
        if (i % 2 == 0) {
            printf("%d is even\\n", i);
        }
    }
    return 10;
}
```

### 6. Run the Lexical Analyzer

To run the lexical analyzer on your sample C code, use the following command:

```bash
./GROUP < Sample_C_code.c
```

### 7. Check the Output

The lexical analyzer will output the recognized tokens from the sample C code. For example:

```
Keyword: int
Identifier: main
Punctuation: (
Punctuation: )
Punctuation: {
Keyword: int
Identifier: x
Operator: =
Literal: 10
Punctuation: ;
Keyword: for
Punctuation: (
Keyword: int
Identifier: i
Operator: =
Literal: 0
Punctuation: ;
Operator: <
Identifier: x
Punctuation: ;
Operator: i
Operator: ++
Punctuation: )
Punctuation: {
Keyword: if
Punctuation: (
Identifier: i
Operator: %
Literal: 2
Operator: ==
Literal: 0
Punctuation: )
Punctuation: {
Identifier: printf
Punctuation: (
String: "%d is even\\n"
Punctuation: ,
Identifier: i
Punctuation: )
Punctuation: ;
Punctuation: }
Punctuation: }
Keyword: return
Literal: 10
Punctuation: ;
Punctuation: }
```

## Project Files

- `group_3.l`: Flex source code to analyze C code and extract tokens.
- `Sample_C_code.c`: Sample C code to test the lexical analyzer.
- `README.md`: This file, providing instructions for running the project.

## License

This project is open-source and available under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Feel free to modify or extend the project as needed!

