DO
$do$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1) THEN
        INSERT INTO rule."condition"("priority", "channelCountryId") VALUES (1, 1);
    END IF;
    -- TZS
    IF NOT EXISTS (
        SELECT
            1
        FROM
            rule."fee"
        WHERE
            "conditionId" IN (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1 AND "startAmountCurrency" = 'TZS')
    ) THEN
        INSERT INTO rule."fee"("conditionId", "startAmount", "startAmountCurrency", "isSourceAmount", "minValue", "maxValue", "percent")
        VALUES ((SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1), 20, 'TZS', true, 1, 5, 1);
    END IF;
    IF NOT EXISTS (
        SELECT
            1
        FROM
            rule."limit"
        WHERE
            "conditionId" IN (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1 AND  "currency" = 'TZS')
    ) THEN
        INSERT INTO rule."limit"("conditionId", "currency", "minAmount", "maxAmount")
        VALUES ((SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1), 'TZS', 10, 1000);
    END IF;
    -- USD
    IF NOT EXISTS (
        SELECT
            1
        FROM
            rule."fee"
        WHERE
            "conditionId" IN (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1 AND "startAmountCurrency" = 'USD')
    ) THEN
        INSERT INTO rule."fee"("conditionId", "startAmount", "startAmountCurrency", "isSourceAmount", "minValue", "maxValue", "percent")
        VALUES ((SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1), 20, 'USD', true, 1, 5, 1);
    END IF;
    IF NOT EXISTS (
        SELECT
            1
        FROM
            rule."limit"
        WHERE
            "conditionId" IN (SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1 AND  "currency" = 'USD')
    ) THEN
        INSERT INTO rule."limit"("conditionId", "currency", "minAmount", "maxAmount")
        VALUES ((SELECT "conditionId" FROM rule."condition" WHERE "priority" = 1 AND "channelCountryId" = 1), 'USD', 10, 1000);
    END IF;
END
$do$