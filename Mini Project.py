import re  # Importing Regular Expressions module

def check_variable_declaration(statement):
    # Regular expression for valid C variable declaration with optional assignment
    pattern = r'^\s*(int|float|char|double)\s+[a-zA-Z_][a-zA-Z0-9_]*\s*(=\s*[^;]+)?\s*;\s*$'
    
    if re.match(pattern, statement):  # Check if statement matches the pattern
        return "✅ Valid variable declaration"
    else:
        return "❌ Invalid variable declaration"

# Main program
print("C Variable Declaration Syntax Analyzer")
print("Enter 'exit' to stop the program.")

while True:
    user_input = input("\nEnter a variable declaration: ")
    
    if user_input.lower() == "exit":
        print("Exiting the program.")
        break  # Stop the loop if user enters 'exit'
    
    result = check_variable_declaration(user_input)  # Check the syntax
    print(result)  # Print the result
