# dfsp-rule
## Instalation:

1. Install postgresql version >= 9.6:

    https://www.postgresql.org/download/

1. Install dependencies:

    execute ```npm install``` in the root directory of the module

1. Configure database connection:

    Set the following environment variable:
    ```
        ut_dfsp_rule_dev_db__db__host=<postgre server host>
        ut_dfsp_rule_dev_db__db__database=<database name>
        ut_dfsp_rule_dev_db__db__user=<postgre username to be created to manage the db>
        ut_dfsp_rule_dev_db__db__password=<postgre password of the user to be created to manage the db>
        ut_dfsp_rule_dev_db__create__user=<postgre username of a user with create users privileges>
        ut_dfsp_rule_dev_db__create__password=<postgre password of the user with create users privileges>
    ```

    Note:
    To set environment variable use ```setx <VAR_NAME> <VAR_VALUE>``` on Windows and ```export <VAR_NAME>=<VAR_VALUE>``` on Unix

1. Run the module:

    execute ```npm start``` in the root directory of the module

    The service should be available on ```http://localhost:8016/documentation```


