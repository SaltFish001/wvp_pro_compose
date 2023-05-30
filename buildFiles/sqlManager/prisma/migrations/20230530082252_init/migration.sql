-- CreateTable
CREATE TABLE `wvp_device` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `device_id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `manufacturer` VARCHAR(255) NULL,
    `model` VARCHAR(255) NULL,
    `firmware` VARCHAR(255) NULL,
    `transport` VARCHAR(50) NULL,
    `stream_mode` VARCHAR(50) NULL,
    `on_line` BOOLEAN NULL DEFAULT false,
    `register_time` VARCHAR(50) NULL,
    `keepalive_time` VARCHAR(50) NULL,
    `ip` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NULL,
    `update_time` VARCHAR(50) NULL,
    `port` INTEGER NULL,
    `expires` INTEGER NULL,
    `subscribe_cycle_for_catalog` INTEGER NULL DEFAULT 0,
    `subscribe_cycle_for_mobile_position` INTEGER NULL DEFAULT 0,
    `mobile_position_submission_interval` INTEGER NULL DEFAULT 5,
    `subscribe_cycle_for_alarm` INTEGER NULL DEFAULT 0,
    `host_address` VARCHAR(50) NULL,
    `charset` VARCHAR(50) NULL,
    `ssrc_check` BOOLEAN NULL DEFAULT false,
    `geo_coord_sys` VARCHAR(50) NULL,
    `tree_type` VARCHAR(50) NULL,
    `media_server_id` VARCHAR(50) NULL,
    `custom_name` VARCHAR(255) NULL,
    `sdp_ip` VARCHAR(50) NULL,
    `local_ip` VARCHAR(50) NULL,
    `password` VARCHAR(255) NULL,
    `as_message_channel` BOOLEAN NULL DEFAULT false,
    `keepalive_interval_time` INTEGER NULL,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_device_device`(`device_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_device_alarm` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `device_id` VARCHAR(50) NOT NULL,
    `channel_id` VARCHAR(50) NOT NULL,
    `alarm_priority` VARCHAR(50) NULL,
    `alarm_method` VARCHAR(50) NULL,
    `alarm_time` VARCHAR(50) NULL,
    `alarm_description` VARCHAR(255) NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `alarm_type` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_device_channel` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `channel_id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `manufacture` VARCHAR(50) NULL,
    `model` VARCHAR(50) NULL,
    `owner` VARCHAR(50) NULL,
    `civil_code` VARCHAR(50) NULL,
    `block` VARCHAR(50) NULL,
    `address` VARCHAR(50) NULL,
    `parent_id` VARCHAR(50) NULL,
    `safety_way` INTEGER NULL,
    `register_way` INTEGER NULL,
    `cert_num` VARCHAR(50) NULL,
    `certifiable` INTEGER NULL,
    `err_code` INTEGER NULL,
    `end_time` VARCHAR(50) NULL,
    `secrecy` VARCHAR(50) NULL,
    `ip_address` VARCHAR(50) NULL,
    `port` INTEGER NULL,
    `password` VARCHAR(255) NULL,
    `ptz_type` INTEGER NULL,
    `status` BOOLEAN NULL DEFAULT false,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `stream_id` VARCHAR(50) NULL,
    `device_id` VARCHAR(50) NOT NULL,
    `parental` VARCHAR(50) NULL,
    `has_audio` BOOLEAN NULL DEFAULT false,
    `create_time` VARCHAR(50) NOT NULL,
    `update_time` VARCHAR(50) NOT NULL,
    `sub_count` INTEGER NULL,
    `longitude_gcj02` DOUBLE NULL,
    `latitude_gcj02` DOUBLE NULL,
    `longitude_wgs84` DOUBLE NULL,
    `latitude_wgs84` DOUBLE NULL,
    `business_group_id` VARCHAR(50) NULL,
    `gps_time` VARCHAR(50) NULL,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_wvp_device_channel_unique_device_channel`(`device_id`, `channel_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_device_mobile_position` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `device_id` VARCHAR(50) NOT NULL,
    `channel_id` VARCHAR(50) NOT NULL,
    `device_name` VARCHAR(255) NULL,
    `time` VARCHAR(50) NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `altitude` DOUBLE NULL,
    `speed` DOUBLE NULL,
    `direction` DOUBLE NULL,
    `report_source` VARCHAR(50) NULL,
    `longitude_gcj02` DOUBLE NULL,
    `latitude_gcj02` DOUBLE NULL,
    `longitude_wgs84` DOUBLE NULL,
    `latitude_wgs84` DOUBLE NULL,
    `create_time` VARCHAR(50) NULL,

    UNIQUE INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_gb_stream` (
    `gb_stream_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `app` VARCHAR(255) NOT NULL,
    `stream` VARCHAR(255) NOT NULL,
    `gb_id` VARCHAR(50) NOT NULL,
    `name` VARCHAR(255) NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `stream_type` VARCHAR(50) NULL,
    `media_server_id` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NULL,

    UNIQUE INDEX `gb_stream_id`(`gb_stream_id`),
    UNIQUE INDEX `uk_gb_stream_unique_gb_id`(`gb_id`),
    UNIQUE INDEX `uk_gb_stream_unique_app_stream`(`app`, `stream`),
    PRIMARY KEY (`gb_stream_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `type` VARCHAR(50) NULL,
    `uri` VARCHAR(200) NULL,
    `address` VARCHAR(50) NULL,
    `result` VARCHAR(50) NULL,
    `timing` BIGINT NULL,
    `username` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NULL,

    UNIQUE INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_media_server` (
    `id` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(50) NULL,
    `hook_ip` VARCHAR(50) NULL,
    `sdp_ip` VARCHAR(50) NULL,
    `stream_ip` VARCHAR(50) NULL,
    `http_port` INTEGER NULL,
    `http_ssl_port` INTEGER NULL,
    `rtmp_port` INTEGER NULL,
    `rtmp_ssl_port` INTEGER NULL,
    `rtp_proxy_port` INTEGER NULL,
    `rtsp_port` INTEGER NULL,
    `rtsp_ssl_port` INTEGER NULL,
    `auto_config` BOOLEAN NULL DEFAULT false,
    `secret` VARCHAR(50) NULL,
    `rtp_enable` BOOLEAN NULL DEFAULT false,
    `rtp_port_range` VARCHAR(50) NULL,
    `record_assist_port` INTEGER NULL,
    `default_server` BOOLEAN NULL DEFAULT false,
    `create_time` VARCHAR(50) NULL,
    `update_time` VARCHAR(50) NULL,
    `hook_alive_interval` INTEGER NULL,

    UNIQUE INDEX `uk_media_server_unique_ip_http_port`(`ip`, `http_port`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_platform_catalog` (
    `id` VARCHAR(50) NULL,
    `platform_id` VARCHAR(50) NULL,
    `name` VARCHAR(255) NULL,
    `parent_id` VARCHAR(50) NULL,
    `civil_code` VARCHAR(50) NULL,
    `business_group_id` VARCHAR(50) NULL,

    UNIQUE INDEX `uk_platform_catalog_id_platform_id`(`id`, `platform_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_platform_gb_channel` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `platform_id` VARCHAR(50) NULL,
    `catalog_id` VARCHAR(50) NULL,
    `device_channel_id` INTEGER NULL,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_platform_gb_channel_platform_id_catalog_id_device_channel_id`(`platform_id`, `catalog_id`, `device_channel_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_platform_gb_stream` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `platform_id` VARCHAR(50) NULL,
    `catalog_id` VARCHAR(50) NULL,
    `gb_stream_id` INTEGER NULL,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_platform_gb_stream_platform_id_catalog_id_gb_stream_id`(`platform_id`, `catalog_id`, `gb_stream_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_stream_proxy` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(50) NULL,
    `app` VARCHAR(255) NULL,
    `stream` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    `src_url` VARCHAR(255) NULL,
    `dst_url` VARCHAR(255) NULL,
    `timeout_ms` INTEGER NULL,
    `ffmpeg_cmd_key` VARCHAR(255) NULL,
    `rtp_type` VARCHAR(50) NULL,
    `media_server_id` VARCHAR(50) NULL,
    `enable_audio` BOOLEAN NULL DEFAULT false,
    `enable_mp4` BOOLEAN NULL DEFAULT false,
    `enable` BOOLEAN NULL DEFAULT false,
    `status` BOOLEAN NULL,
    `enable_remove_none_reader` BOOLEAN NULL DEFAULT false,
    `create_time` VARCHAR(50) NULL,
    `name` VARCHAR(255) NULL,
    `update_time` VARCHAR(50) NULL,
    `enable_disable_none_reader` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_stream_proxy_app_stream`(`app`, `stream`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_stream_push` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `app` VARCHAR(255) NULL,
    `stream` VARCHAR(255) NULL,
    `total_reader_count` VARCHAR(50) NULL,
    `origin_type` INTEGER NULL,
    `origin_type_str` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NULL,
    `alive_second` INTEGER NULL,
    `media_server_id` VARCHAR(50) NULL,
    `push_time` VARCHAR(50) NULL,
    `status` BOOLEAN NULL DEFAULT false,
    `update_time` VARCHAR(50) NULL,
    `push_ing` BOOLEAN NULL DEFAULT false,
    `self` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_stream_push_app_stream`(`app`, `stream`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_user` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `role_id` INTEGER NULL,
    `create_time` VARCHAR(50) NULL,
    `update_time` VARCHAR(50) NULL,
    `push_key` VARCHAR(50) NULL,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_user_username`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_user_role` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `authority` VARCHAR(50) NULL,
    `create_time` VARCHAR(50) NULL,
    `update_time` VARCHAR(50) NULL,

    UNIQUE INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wvp_platform` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `enable` BOOLEAN NULL DEFAULT false,
    `name` VARCHAR(255) NULL,
    `server_gb_id` VARCHAR(50) NULL,
    `server_gb_domain` VARCHAR(50) NULL,
    `server_ip` VARCHAR(50) NULL,
    `server_port` INTEGER NULL,
    `device_gb_id` VARCHAR(50) NULL,
    `device_ip` VARCHAR(50) NULL,
    `device_port` VARCHAR(50) NULL,
    `username` VARCHAR(255) NULL,
    `password` VARCHAR(50) NULL,
    `expires` VARCHAR(50) NULL,
    `keep_timeout` VARCHAR(50) NULL,
    `transport` VARCHAR(50) NULL,
    `character_set` VARCHAR(50) NULL,
    `catalog_id` VARCHAR(50) NULL,
    `ptz` BOOLEAN NULL DEFAULT false,
    `rtcp` BOOLEAN NULL DEFAULT false,
    `status` BOOLEAN NULL DEFAULT false,
    `start_offline_push` BOOLEAN NULL DEFAULT false,
    `administrative_division` VARCHAR(50) NULL,
    `catalog_group` INTEGER NULL,
    `create_time` VARCHAR(50) NULL,
    `update_time` VARCHAR(50) NULL,
    `tree_type` VARCHAR(50) NULL,
    `as_message_channel` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `uk_platform_unique_server_gb_id`(`server_gb_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
