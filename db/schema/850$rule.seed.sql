DO
$do$
BEGIN

INSERT INTO
    rule."condition" ("conditionId", "priority", "operationId", "operationTag")
VALUES
    (1, 1, 1, 'p2p'),
    (2, 2, 2, 'invoice'),
    (3, 3, 3, 'fee'),
    (4, 4, 4, 'bulkPayment'),
    (5, 5, 5, 'cashIn'),
    (6, 6, 6, 'cashOut')
ON CONFLICT ("conditionId") DO UPDATE SET
    "priority" = EXCLUDED."priority",
    "operationId" = EXCLUDED."operationId",
    "operationTag" = EXCLUDED."operationTag";


INSERT INTO
    rule."fee" (
        "feeId",
        "conditionId",
        "startAmount",
        "startAmountCurrency",
        "isSourceAmount",
        "minValue",
        "maxValue",
        "percent"
    )
VALUES
    (1, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 2000, 'TZS', true, 100, 500, 1),
    (2, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 20, 'USD', true, 1, 5, 1),
    (3, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 2000, 'TZS', true, 100, 500, 1),
    (4, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 20, 'USD', true, 1, 5, 1),
    (5, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 2000, 'TZS', true, 100, 500, 1),
    (6, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 20, 'USD', true, 1, 5, 1),
    (7, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 2000, 'TZS', true, 100, 500, 1),
    (8, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 20, 'USD', true, 1, 5, 1),
    (9, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 2000, 'TZS', true, 100, 500, 1),
    (10, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 20, 'USD', true, 1, 5, 1),
    (11, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 2000, 'TZS', true, 100, 500, 1),
    (12, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 20, 'USD', true, 1, 5, 1)
ON CONFLICT ("feeId") DO UPDATE SET
    "conditionId" = EXCLUDED."conditionId",
    "startAmount" = EXCLUDED."startAmount",
    "startAmountCurrency" = EXCLUDED."startAmountCurrency",
    "isSourceAmount" = EXCLUDED."isSourceAmount",
    "minValue" = EXCLUDED."minValue",
    "maxValue" = EXCLUDED."maxValue",
    "percent" = EXCLUDED."percent";


INSERT INTO
    rule."limit" (
        "limitId",
        "conditionId",
        "currency",
        "minAmount",
        "maxAmount",
        "maxAmountDaily",
        "maxCountDaily",
        "maxAmountWeekly",
        "maxCountWeekly",
        "maxAmountMonthly",
        "maxCountMonthly"
    )
VALUES
    (1, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (2, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000),
    (3, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (4, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000),
    (5, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (6, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000),
    (7, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (8, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000),
    (9, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (10, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000),
    (11, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 'TZS', 1000, 100000, 100000, 10000, 400000, 40000, 1000000, 100000),
    (12, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 'USD', 10, 1000, 1000, 100, 4000, 400, 10000, 1000)
ON CONFLICT ("limitId") DO UPDATE SET
    "conditionId" = EXCLUDED."conditionId",
    "currency" = EXCLUDED."currency",
    "minAmount" = EXCLUDED."minAmount",
    "maxAmount" = EXCLUDED."maxAmount",
    "maxAmountDaily" = EXCLUDED."maxAmountDaily",
    "maxCountDaily" = EXCLUDED."maxCountDaily",
    "maxAmountWeekly" = EXCLUDED."maxAmountWeekly",
    "maxCountWeekly" = EXCLUDED."maxCountWeekly",
    "maxAmountMonthly" = EXCLUDED."maxAmountMonthly",
    "maxCountMonthly" = EXCLUDED."maxCountMonthly";


INSERT INTO
    rule."commission" (
        "commissionId",
        "conditionId",
        "startAmount",
        "startAmountCurrency",
        "isSourceAmount",
        "minValue",
        "maxValue",
        "percent",
        "percentBase"
    )
VALUES
    (1, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (2, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1), 10, 'USD', true, 0, 50, 2, 50),
    (3, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (4, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 2), 10, 'USD', true, 0, 50, 2, 50),
    (5, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (6, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 3), 10, 'USD', true, 0, 50, 2, 50),
    (7, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (8, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 4), 10, 'USD', true, 0, 50, 2, 50),
    (9, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (10, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 5), 10, 'USD', true, 0, 50, 2, 50),
    (11, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 1000, 'TZS', true, 0, 5000, 2, 5000),
    (12, (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 6), 10, 'USD', true, 0, 50, 2, 50)
ON CONFLICT ("commissionId") DO UPDATE SET
    "conditionId" = EXCLUDED."conditionId",
    "startAmount" = EXCLUDED."startAmount",
    "startAmountCurrency" = EXCLUDED."startAmountCurrency",
    "isSourceAmount" = EXCLUDED."isSourceAmount",
    "minValue" = EXCLUDED."minValue",
    "maxValue" = EXCLUDED."maxValue",
    "percent" = EXCLUDED."percent",
    "percentBase" = EXCLUDED."percentBase";

END
$do$