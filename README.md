# Robot Framework API Testing

This repository contains Robot Framework test suites for API testing. Robot Framework is a generic open-source automation framework for acceptance testing, acceptance test-driven development (ATDD), and robotic process automation (RPA).

## Prerequisites

1. **Python**: Ensure you have Python installed on your system. You can download it from [python.org](https://www.python.org/downloads/).

2. **Robot Framework**: Install Robot Framework using pip:

    ```bash
    pip install robotframework
    ```

3. **Requests Library**: Install the Requests library for making HTTP requests:

    ```bash
    pip install requests
    ```

4. **Robot Framework Requests Library**: Install the Robot Framework Requests library for simplified API testing:

    ```bash
    pip install robotframework-requests
    ```

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/your-username/robot-api-testing.git
    cd robot-api-testing
    ```

2. Navigate to the directory containing your test suites.

3. Run the tests using the `robot` command:

    ```bash
    robot tests/*.robot
    ```

## Folder Structure

- **tests/**: Contains all the Robot Framework test suites.
- **keywords/**: Contains custom keywords and libraries used in the test suites.
- **resources/**: Stores any resources needed for testing, such as data files or configuration files.
- **results/**: Contains test execution reports and logs.

## Writing Tests

1. Create new test suites inside the `tests/` directory.

2. Utilize Robot Framework's keyword-driven syntax to define test cases. Here's a basic example:

    ```robot
    *** Settings ***
    Library    RequestsLibrary

    *** Test Cases ***
    Verify API Response
        Get Request    https://api.example.com/data
        Should Be Equal As Strings    ${response.status_code}    200
    ```

3. Run the tests using the instructions provided in the "Usage" section.

## Reporting

After running tests, you can find the HTML report in the `results/` directory. Open `results/report.html` in your browser to view the test execution summary.

## Contribution

Contributions are welcome! If you find any issues or want to improve the tests, feel free to open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
