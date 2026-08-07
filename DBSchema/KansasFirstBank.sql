CREATE TABLE "ksbnk_accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "ksbnk_entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "ksbnk_transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint,
  "to_account_id" bigint,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "ksbnk_accounts" ("owner");

CREATE INDEX ON "ksbnk_entries" ("account_id");

CREATE INDEX ON "ksbnk_transfers" ("from_account_id");

CREATE INDEX ON "ksbnk_transfers" ("to_account_id");

CREATE INDEX ON "ksbnk_transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "ksbnk_entries"."amount" IS 'Can be neg/pos values';

COMMENT ON COLUMN "ksbnk_transfers"."amount" IS 'Must be positive value';

ALTER TABLE "ksbnk_entries" ADD FOREIGN KEY ("account_id") REFERENCES "ksbnk_accounts" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "ksbnk_transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "ksbnk_accounts" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "ksbnk_transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "ksbnk_accounts" ("id") DEFERRABLE INITIALLY IMMEDIATE;
