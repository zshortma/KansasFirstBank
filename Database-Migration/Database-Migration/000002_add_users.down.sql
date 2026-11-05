ALTER TABLE IF EXISTS "ksbnk_accounts" DROP CONSTRAINT IF EXISTS "owner_currency_key";
ALTER TABLE IF EXISTS "ksbnk_accounts" DROP CONSTRAINT IF EXISTS "ksbnk_accounts_owner_fkey";
DROP TABLE IF EXISTS "ksbank_users";