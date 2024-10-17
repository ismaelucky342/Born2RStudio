# Function to sum two numbers
sum_of_two_numbers <- function(a, b) { #function
  return(a + b)
}

mult_of_two_numbers <- function(a, b) {
  return(a * b)
}

# Example usage
number1 <- 234
number2 <- 122
result <- sum_of_two_numbers(number1, number2)
result2 <- mult_of_two_numbers(number1, number2)

print(paste("The sum of", number1, "and", number2, "is", result))
print(paste("The mult of", number1, "and", number2, "is", result2))

