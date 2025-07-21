# BDD Structure for Login Android Flow

## Overview
This document describes the Given-When-Then (BDD) structure for the Android login flow test automation.

## BDD Pattern Explanation

### Given (Preconditions)
- **Purpose**: Set up the initial state and context for the test
- **Examples**: 
  - User is on Login Screen
  - User is successfully logged in

### When (Actions)
- **Purpose**: Describe the specific actions or events that occur
- **Examples**:
  - User clicks Sign In button
  - User enters valid username
  - User enters invalid password

### Then (Expected Results)
- **Purpose**: Define the expected outcomes and verifications
- **Examples**:
  - System should display error message
  - User should be successfully logged in
  - User should be redirected to main screen

## Test Cases Breakdown

### 1. Validate Empty Fields
```
Given User is on Login Screen
When User clicks Sign In button without entering credentials
Then System should display empty field validation errors for both username and password
```

**Business Value**: Ensures the system properly validates required fields and provides clear error messages to users.

### 2. Validate Minimum Password Length
```
Given User is on Login Screen
When User enters password with minimum length "ab"
And User clicks Sign In button
Then System should display minimum password length error message
```

**Business Value**: Ensures password security requirements are enforced and communicated to users.

### 3. Validate Login with Invalid Credentials
```
Given User is on Login Screen
When User enters valid username "SchoolLe"
And User enters invalid password "Schools123@@@"
And User clicks Sign In button
Then System should display login failed error message
```

**Business Value**: Ensures system security by properly handling invalid login attempts.

### 4. Validate Successful Login
```
Given User is on Login Screen
When User enters valid email "school@yopmail.com"
And User enters valid password "School123@"
And User clicks Sign In button
Then User should be successfully logged in and redirected to main screen
```

**Business Value**: Ensures the core login functionality works correctly for valid users.

### 5. Validate Successful Logout
```
Given User is successfully logged in
When User clicks Sign Out button
And User confirms logout action
Then User should be logged out and redirected to login screen
```

**Business Value**: Ensures users can securely log out and session management works properly.

## Keywords Organization

### Given Keywords
- **User is on Login Screen**: Navigate to login screen and select role
- **User is successfully logged in**: Complete login process with valid credentials

### When Keywords
- **User clicks Sign In button**: Perform sign in action
- **User enters valid username**: Input valid username/email
- **User enters invalid password**: Input incorrect password
- **User enters valid password**: Input correct password
- **User clicks Sign Out button**: Initiate logout process
- **User confirms logout action**: Confirm logout dialog

### Then Keywords
- **System should display empty field validation errors**: Verify validation messages
- **System should display minimum password length error message**: Verify password requirements
- **System should display login failed error message**: Verify failed login handling
- **User should be successfully logged in**: Verify successful authentication
- **User should be logged out**: Verify successful logout

## Benefits of BDD Structure

1. **Readability**: Test cases read like natural language specifications
2. **Maintainability**: Clear separation of concerns between setup, actions, and verifications
3. **Reusability**: Keywords can be reused across different test scenarios
4. **Collaboration**: Non-technical stakeholders can understand and review test cases
5. **Documentation**: Tests serve as living documentation of system behavior

## Best Practices

1. **Given**: Keep setup minimal and focused on the specific test scenario
2. **When**: Use action-oriented language that describes user behavior
3. **Then**: Focus on business outcomes rather than technical implementation
4. **Keywords**: Make keywords descriptive and reusable
5. **Data**: Use variables for test data to make tests more maintainable

## Running the Tests

```bash
# Run all BDD login tests
robot Tests/Authen/LoginAndroid_BDD.robot

# Run specific test case
robot -t "Validate Empty Fields" Tests/Authen/LoginAndroid_BDD.robot

# Run with tags (if implemented)
robot --include "login" Tests/Authen/LoginAndroid_BDD.robot
``` 