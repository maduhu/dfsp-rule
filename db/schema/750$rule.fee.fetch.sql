CREATE OR REPLACE FUNCTION rule."fee.fetch"(
    IN "@currency" char(3)
)
RETURNS TABLE(
    "isSingleResult" boolean,
    "outgoing" json,
    "incoming" json
) AS
$BODY$
    SELECT
        true AS "isSingleResult",
        CASE WHEN count(f1) = 0 THEN '[]' ELSE json_agg((
            SELECT
                x
            FROM (
                SELECT
                    f1."conditionId",
                    f1."startAmount",
                    f1."startAmountCurrency",
                    f1."minValue",
                    f1."maxValue",
                    f1."percent",
                    f1."percentBase"
            ) AS x
        )) END AS outgoing,
        CASE WHEN count(f2) = 0 THEN '[]' ELSE json_agg((
            SELECT
                x
            FROM (
                SELECT
                    f2."conditionId",
                    f2."startAmount",
                    f2."startAmountCurrency",
                    f2."minValue",
                    f2."maxValue",
                    f2."percent",
                    f2."percentBase"
            ) AS x
        )) END AS incoming
    FROM rule.fee f1
    LEFT JOIN LATERAL (
        SELECT
            *
        FROM
            rule.fee
        WHERE "isSourceAmount" = false AND ("@currency" IS NULL OR "startAmountCurrency" = "@currency")
    ) f2 ON TRUE
    WHERE f1."isSourceAmount" = true AND ("@currency" IS NULL OR f1."startAmountCurrency" = "@currency")
$BODY$
LANGUAGE SQL
