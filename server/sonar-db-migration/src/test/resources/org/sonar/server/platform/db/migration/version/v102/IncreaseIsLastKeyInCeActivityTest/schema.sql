CREATE TABLE "CE_ACTIVITY"(
    "UUID" CHARACTER VARYING(40) NOT NULL,
    "TASK_TYPE" CHARACTER VARYING(40) NOT NULL,
    "ENTITY_UUID" CHARACTER VARYING(40),
    "COMPONENT_UUID" CHARACTER VARYING(40),
    "STATUS" CHARACTER VARYING(15) NOT NULL,
    "MAIN_IS_LAST" BOOLEAN NOT NULL,
    "MAIN_IS_LAST_KEY" CHARACTER VARYING(55) NOT NULL,
    "IS_LAST" BOOLEAN NOT NULL,
    "IS_LAST_KEY" CHARACTER VARYING(55) NOT NULL,
    "SUBMITTER_UUID" CHARACTER VARYING(255),
    "SUBMITTED_AT" BIGINT NOT NULL,
    "STARTED_AT" BIGINT,
    "EXECUTED_AT" BIGINT,
    "EXECUTION_COUNT" INTEGER NOT NULL,
    "EXECUTION_TIME_MS" BIGINT,
    "ANALYSIS_UUID" CHARACTER VARYING(50),
    "ERROR_MESSAGE" CHARACTER VARYING(1000),
    "ERROR_STACKTRACE" CHARACTER LARGE OBJECT,
    "ERROR_TYPE" CHARACTER VARYING(20),
    "WORKER_UUID" CHARACTER VARYING(40),
    "CREATED_AT" BIGINT NOT NULL,
    "UPDATED_AT" BIGINT NOT NULL,
    "NODE_NAME" CHARACTER VARYING(100)
);
ALTER TABLE "CE_ACTIVITY" ADD CONSTRAINT "PK_CE_ACTIVITY" PRIMARY KEY("UUID");
CREATE INDEX "CE_ACTIVITY_COMPONENT" ON "CE_ACTIVITY"("COMPONENT_UUID" NULLS FIRST);
CREATE INDEX "CE_ACTIVITY_ISLAST" ON "CE_ACTIVITY"("IS_LAST" NULLS FIRST, "STATUS" NULLS FIRST);
CREATE INDEX "CE_ACTIVITY_ISLAST_KEY" ON "CE_ACTIVITY"("IS_LAST_KEY" NULLS FIRST);
CREATE INDEX "CE_ACTIVITY_MAIN_ISLAST" ON "CE_ACTIVITY"("MAIN_IS_LAST" NULLS FIRST, "STATUS" NULLS FIRST);
CREATE INDEX "CE_ACTIVITY_MAIN_ISLAST_KEY" ON "CE_ACTIVITY"("MAIN_IS_LAST_KEY" NULLS FIRST);
CREATE INDEX "CE_ACTIVITY_ENTITY_UUID" ON "CE_ACTIVITY"("ENTITY_UUID" NULLS FIRST);
