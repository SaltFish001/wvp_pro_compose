-- AlterTable
ALTER TABLE `device` ADD COLUMN `asMessageChannel` INTEGER NULL DEFAULT 0,
    ADD COLUMN `mediaServerId` VARCHAR(50) NULL;

-- AlterTable
ALTER TABLE `parent_platform` ADD COLUMN `asMessageChannel` INTEGER NULL DEFAULT 0;
