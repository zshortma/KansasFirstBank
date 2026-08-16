-- name: CreateEntry :one
INSERT INTO ksbnk_entries (
  account_id,
  amount
) VALUES (
  $1, $2
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM ksbnk_entries
WHERE id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * FROM ksbnk_entries
WHERE account_id = $1
ORDER BY id
LIMIT $2
OFFSET $3;