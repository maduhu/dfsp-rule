# dfsp-rule
## Instalation

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

    The service should be available on http://localhost:8016/documentation


## Configuration

Configuration of the module is made through environment variables in the format ```ut_dfsp_rule_dev_<config_property>```
You can replace the ```<config_property>``` part of the variable with the following configurations:

* ```httpserver__port``` - change the http port of the module. Default value is 8016



## API Endpoints

* ```POST /rpc/rule/rule/add``` - add new rule

    Request body:
    ```
    {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "rule.rule.add",
        "params": {
            "condition": {
                "priority": 1,
                "operationId": 1,
                "operationTag": "p2p"
            },
            "fee": {
                "startAmount": 20,
                "startAmountCurrency": "USD",
                "isSourceAmount": true,
                "minValue": 1,
                "maxValue": 5,
                "percent": 1,
                "percentBase": 10
            },
            "limit": {
                "currency": "USD",
                "minAmount": 10,
                "maxAmount": 1000,
                "maxAmountDaily": 1000,
                "maxCountDaily": 10,
                "maxAmountWeekly": 4000,
                "maxCountWeekly": 40,
                "maxAmountMonthly": 10000,
                "maxCountMonthly": 100
            },
            "commission": {
                "startAmount": 20,
                "startAmountCurrency": "USD",
                "isSourceAmount": true,
                "minValue": 1,
                "maxValue": 5,
                "percent": 1,
                "percentBase": 10
            }
        }
    }
    ```

* ```POST /rpc/rule/rule/fetch``` - fetch rules

    Request body:
    ```
    {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "rule.rule.fetch",
        "params": {
            "conditionId": 1
        }
    }
    ```

* ```POST /rpc/rule/rule/edit``` - edit existing rule

    Request body:
    ```
    {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "rule.rule.edit",
        "params": {
            "condition": {
                "conditionId: 1,
                "priority": 1,
                "operationId": 1,
                "operationTag": "p2p"
            },
            "fee": {
                "feeId": 1,
                "startAmount": 20,
                "startAmountCurrency": "USD",
                "isSourceAmount": true,
                "minValue": 1,
                "maxValue": 5,
                "percent": 1,
                "percentBase": 10
            },
            "limit": {
                "limitId": 1,
                "currency": "USD",
                "minAmount": 10,
                "maxAmount": 1000,
                "maxAmountDaily": 1000,
                "maxCountDaily": 10,
                "maxAmountWeekly": 4000,
                "maxCountWeekly": 40,
                "maxAmountMonthly": 10000,
                "maxCountMonthly": 100
            },
            "commission": {
                "commissionId": 1,
                "startAmount": 20,
                "startAmountCurrency": "USD",
                "isSourceAmount": true,
                "minValue": 1,
                "maxValue": 5,
                "percent": 1,
                "percentBase": 10
            }
        }
    }
    ```

* ```POST /rpc/rule/rule/remove``` - remove existing rule

    Request body:
    ```
    {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "rule.rule.remove",
        "params": {
            "conditionId": [1]
        }
    }
    ```

* ```POST /rpc/rule/decision/fetch``` - fetch fee, commission and limit for given params

    Request body:
    ```
    {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "rule.decision.fetch",
        "params": {
            "operationTags": "|p2p|",
            "amount": 42,
            "currency": "USD"
        }
    }
    ```



