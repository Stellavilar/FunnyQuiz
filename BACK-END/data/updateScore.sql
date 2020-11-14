BEGIN;

ALTER TABLE "score" ADD COLUMN "tag_id" integer;

ALTER TABLE "score" ADD COLUMN "level_id" integer;

ALTER TABLE "score" ADD COLUMN "subcategory_id" integer;

COMMIT;