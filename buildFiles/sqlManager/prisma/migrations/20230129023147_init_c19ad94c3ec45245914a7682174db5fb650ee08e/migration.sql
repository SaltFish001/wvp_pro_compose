-- CreateTable
CREATE TABLE `device` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `deviceId` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `manufacturer` VARCHAR(255) NULL,
    `model` VARCHAR(255) NULL,
    `firmware` VARCHAR(255) NULL,
    `transport` VARCHAR(50) NULL,
    `streamMode` VARCHAR(50) NULL,
    `online` VARCHAR(50) NULL,
    `registerTime` VARCHAR(50) NULL,
    `keepaliveTime` VARCHAR(50) NULL,
    `ip` VARCHAR(50) NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `updateTime` VARCHAR(50) NOT NULL,
    `port` INTEGER NULL,
    `expires` INTEGER NULL,
    `subscribeCycleForCatalog` INTEGER NULL,
    `hostAddress` VARCHAR(50) NULL,
    `charset` VARCHAR(50) NOT NULL,
    `subscribeCycleForMobilePosition` INTEGER NULL,
    `mobilePositionSubmissionInterval` INTEGER NULL DEFAULT 5,
    `subscribeCycleForAlarm` INTEGER NULL,
    `ssrcCheck` INTEGER NULL DEFAULT 0,
    `geoCoordSys` VARCHAR(50) NOT NULL,
    `treeType` VARCHAR(50) NOT NULL,
    `custom_name` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `sdpIp` VARCHAR(50) NULL,
    `localIp` VARCHAR(50) NULL,
    `keepaliveIntervalTime` INTEGER NULL,

    UNIQUE INDEX `device_deviceId_uindex`(`deviceId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `device_alarm` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `deviceId` VARCHAR(50) NOT NULL,
    `channelId` VARCHAR(50) NOT NULL,
    `alarmPriority` VARCHAR(50) NOT NULL,
    `alarmMethod` VARCHAR(50) NULL,
    `alarmTime` VARCHAR(50) NOT NULL,
    `alarmDescription` VARCHAR(255) NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `alarmType` VARCHAR(50) NULL,
    `createTime` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `device_channel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `channelId` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `manufacture` VARCHAR(50) NULL,
    `model` VARCHAR(50) NULL,
    `owner` VARCHAR(50) NULL,
    `civilCode` VARCHAR(50) NULL,
    `block` VARCHAR(50) NULL,
    `address` VARCHAR(50) NULL,
    `parentId` VARCHAR(50) NULL,
    `safetyWay` INTEGER NULL,
    `registerWay` INTEGER NULL,
    `certNum` VARCHAR(50) NULL,
    `certifiable` INTEGER NULL,
    `errCode` INTEGER NULL,
    `endTime` VARCHAR(50) NULL,
    `secrecy` VARCHAR(50) NULL,
    `ipAddress` VARCHAR(50) NULL,
    `port` INTEGER NULL,
    `password` VARCHAR(255) NULL,
    `PTZType` INTEGER NULL,
    `status` INTEGER NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `streamId` VARCHAR(50) NULL,
    `deviceId` VARCHAR(50) NOT NULL,
    `parental` VARCHAR(50) NULL,
    `hasAudio` BIT(1) NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `updateTime` VARCHAR(50) NOT NULL,
    `subCount` INTEGER NULL DEFAULT 0,
    `longitudeGcj02` DOUBLE NULL,
    `latitudeGcj02` DOUBLE NULL,
    `longitudeWgs84` DOUBLE NULL,
    `latitudeWgs84` DOUBLE NULL,
    `businessGroupId` VARCHAR(50) NULL,
    `gpsTime` VARCHAR(50) NULL,

    UNIQUE INDEX `device_channel_id_uindex`(`id`),
    UNIQUE INDEX `device_channel_pk`(`channelId`, `deviceId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `device_mobile_position` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `deviceId` VARCHAR(50) NOT NULL,
    `channelId` VARCHAR(50) NOT NULL,
    `deviceName` VARCHAR(255) NULL,
    `time` VARCHAR(50) NOT NULL,
    `longitude` DOUBLE NOT NULL,
    `latitude` DOUBLE NOT NULL,
    `altitude` DOUBLE NULL,
    `speed` DOUBLE NULL,
    `direction` DOUBLE NULL,
    `reportSource` VARCHAR(50) NULL,
    `longitudeGcj02` DOUBLE NULL,
    `latitudeGcj02` DOUBLE NULL,
    `longitudeWgs84` DOUBLE NULL,
    `latitudeWgs84` DOUBLE NULL,
    `createTime` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gb_stream` (
    `gbStreamId` INTEGER NOT NULL AUTO_INCREMENT,
    `app` VARCHAR(255) NOT NULL,
    `stream` VARCHAR(255) NOT NULL,
    `gbId` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `streamType` VARCHAR(50) NULL,
    `mediaServerId` VARCHAR(50) NULL,
    `createTime` VARCHAR(50) NULL,

    UNIQUE INDEX `gbId`(`gbId`),
    UNIQUE INDEX `app`(`app`, `stream`),
    PRIMARY KEY (`gbStreamId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `log` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `uri` VARCHAR(200) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `result` VARCHAR(50) NOT NULL,
    `timing` BIGINT NOT NULL,
    `username` VARCHAR(50) NOT NULL,
    `createTime` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `media_server` (
    `id` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(50) NOT NULL,
    `hookIp` VARCHAR(50) NOT NULL,
    `sdpIp` VARCHAR(50) NOT NULL,
    `streamIp` VARCHAR(50) NOT NULL,
    `httpPort` INTEGER NOT NULL,
    `httpSSlPort` INTEGER NOT NULL,
    `rtmpPort` INTEGER NOT NULL,
    `rtmpSSlPort` INTEGER NOT NULL,
    `rtpProxyPort` INTEGER NOT NULL,
    `rtspPort` INTEGER NOT NULL,
    `rtspSSLPort` INTEGER NOT NULL,
    `autoConfig` INTEGER NOT NULL,
    `secret` VARCHAR(50) NOT NULL,
    `rtpEnable` INTEGER NOT NULL,
    `rtpPortRange` VARCHAR(50) NOT NULL,
    `recordAssistPort` INTEGER NOT NULL,
    `defaultServer` INTEGER NOT NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `updateTime` VARCHAR(50) NOT NULL,
    `hookAliveInterval` INTEGER NOT NULL,

    UNIQUE INDEX `media_server_i`(`ip`, `httpPort`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `parent_platform` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `enable` INTEGER NULL,
    `name` VARCHAR(255) NULL,
    `serverGBId` VARCHAR(50) NOT NULL,
    `serverGBDomain` VARCHAR(50) NULL,
    `serverIP` VARCHAR(50) NULL,
    `serverPort` INTEGER NULL,
    `deviceGBId` VARCHAR(50) NOT NULL,
    `deviceIp` VARCHAR(50) NULL,
    `devicePort` VARCHAR(50) NULL,
    `username` VARCHAR(255) NULL,
    `password` VARCHAR(50) NULL,
    `expires` VARCHAR(50) NULL,
    `keepTimeout` VARCHAR(50) NULL,
    `transport` VARCHAR(50) NULL,
    `characterSet` VARCHAR(50) NULL,
    `catalogId` VARCHAR(50) NOT NULL,
    `ptz` INTEGER NULL,
    `rtcp` INTEGER NULL,
    `status` BIT(1) NULL,
    `startOfflinePush` INTEGER NULL DEFAULT 0,
    `administrativeDivision` VARCHAR(50) NOT NULL,
    `catalogGroup` INTEGER NULL DEFAULT 1,
    `createTime` VARCHAR(50) NULL,
    `updateTime` VARCHAR(50) NULL,
    `treeType` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `parent_platform_id_uindex`(`id`),
    UNIQUE INDEX `parent_platform_pk`(`serverGBId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `platform_catalog` (
    `id` VARCHAR(50) NOT NULL,
    `platformId` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `parentId` VARCHAR(50) NULL,
    `civilCode` VARCHAR(50) NULL,
    `businessGroupId` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `platform_gb_channel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `platformId` VARCHAR(50) NOT NULL,
    `catalogId` VARCHAR(50) NOT NULL,
    `deviceChannelId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `platform_gb_stream` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `platformId` VARCHAR(50) NOT NULL,
    `catalogId` VARCHAR(50) NOT NULL,
    `gbStreamId` INTEGER NOT NULL,

    UNIQUE INDEX `platform_gb_stream_pk`(`platformId`, `catalogId`, `gbStreamId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stream_proxy` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(50) NOT NULL,
    `app` VARCHAR(255) NOT NULL,
    `stream` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NULL,
    `src_url` VARCHAR(255) NULL,
    `dst_url` VARCHAR(255) NULL,
    `timeout_ms` INTEGER NULL,
    `ffmpeg_cmd_key` VARCHAR(255) NULL,
    `rtp_type` VARCHAR(50) NULL,
    `mediaServerId` VARCHAR(50) NULL,
    `enable_audio` BIT(1) NULL,
    `enable_mp4` BIT(1) NULL,
    `enable` BIT(1) NOT NULL,
    `status` BIT(1) NOT NULL,
    `enable_remove_none_reader` BIT(1) NOT NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `updateTime` VARCHAR(50) NULL,
    `enable_disable_none_reader` BIT(1) NULL,

    UNIQUE INDEX `stream_proxy_pk`(`app`, `stream`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stream_push` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `app` VARCHAR(255) NOT NULL,
    `stream` VARCHAR(255) NOT NULL,
    `totalReaderCount` VARCHAR(50) NULL,
    `originType` INTEGER NULL,
    `originTypeStr` VARCHAR(50) NULL,
    `createTime` VARCHAR(50) NULL,
    `aliveSecond` INTEGER NULL,
    `mediaServerId` VARCHAR(50) NULL,
    `serverId` VARCHAR(50) NOT NULL,
    `pushTime` VARCHAR(50) NULL,
    `status` INTEGER NULL,
    `updateTime` VARCHAR(50) NULL,
    `pushIng` INTEGER NULL,
    `self` INTEGER NULL,

    UNIQUE INDEX `stream_push_pk`(`app`, `stream`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `roleId` INTEGER NOT NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `updateTime` VARCHAR(50) NOT NULL,
    `pushKey` VARCHAR(50) NULL,

    UNIQUE INDEX `user_username_uindex`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_role` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `authority` VARCHAR(50) NOT NULL,
    `createTime` VARCHAR(50) NOT NULL,
    `updateTime` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'2021-04-13 14:14:57','2021-04-13 14:14:57','3e80d1762a324d5b0ff636e0bd16f1e3');
INSERT INTO `user_role` VALUES (1,'admin','0','2021-04-13 14:14:57','2021-04-13 14:14:57');