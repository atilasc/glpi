--
-- Structure de la table 'glpi_plugin_mydashboard_profiles'
-- gestion des droits pour le plugin
--

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_profiles`;
CREATE TABLE `glpi_plugin_mydashboard_profiles`
(
    `id`          int unsigned NOT NULL AUTO_INCREMENT,          -- id du profil
    `profiles_id` int unsigned NOT NULL            DEFAULT '0'
        COMMENT 'RELATION to glpi_profiles (id)',           -- lien avec profiles de glpi
    `mydashboard` CHAR(1)
                      COLLATE utf8_unicode_ci DEFAULT NULL, -- $right:  r (can view), w (can update)
    `config`      CHAR(1)
                      COLLATE utf8_unicode_ci DEFAULT NULL, -- $right:  r (can view), w (can update)
    PRIMARY KEY (`id`),
    KEY `profiles_id` (`profiles_id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

--
-- Structure de la table 'glpi_plugin_mydashboard_widgets'
-- 
--

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_widgets`;
CREATE TABLE `glpi_plugin_mydashboard_widgets`
(
    `id`   int unsigned      NOT NULL AUTO_INCREMENT, -- id du widget
    `name` VARCHAR(255) NOT NULL,                -- nom du widget
    PRIMARY KEY (`id`),
    UNIQUE (`name`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

--
-- Structure de la table 'glpi_plugin_mydashboard_userwidgets'
-- 
--

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_userwidgets`;
CREATE TABLE `glpi_plugin_mydashboard_userwidgets`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT, -- id
    `users_id`   int unsigned NOT NULL
        COMMENT 'RELATION to glpi_users(id)',
    `widgets_id` int NOT NULL,                -- id du widget
    `place`      int unsigned NOT NULL,                -- placement du widget
    PRIMARY KEY (`id`),
    FOREIGN KEY (`users_id`) REFERENCES glpi_users (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

--
-- Structure de la table 'glpi_plugin_mydashboard_configs'
-- 
--

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_configs`;
CREATE TABLE `glpi_plugin_mydashboard_configs`
(
    `id`                    int unsigned    NOT NULL AUTO_INCREMENT, -- id
    `enable_fullscreen`     tinyint NOT NULL DEFAULT '1',
    `display_menu`          tinyint NOT NULL DEFAULT '1',
    `display_plugin_widget` tinyint NOT NULL DEFAULT '1',
    `replace_central`       tinyint NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

--
-- Structure de la table 'glpi_plugin_mydashboard_preferences'
-- 
--

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_preferences`;
CREATE TABLE `glpi_plugin_mydashboard_preferences`
(
    `id`                      int unsigned    NOT NULL
        COMMENT 'RELATION to glpi_users(id)',
    `automatic_refresh`       tinyint NOT NULL DEFAULT '0',
    `automatic_refresh_delay` int unsigned    NOT NULL DEFAULT '10',
    `nb_widgets_width`        int unsigned    NOT NULL DEFAULT '3',
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

--
-- Structure de la table 'glpi_plugin_mydashboard_preferenceuserblacklists'
-- 
--
DROP TABLE IF EXISTS `glpi_plugin_mydashboard_preferenceuserblacklists`;
CREATE TABLE `glpi_plugin_mydashboard_preferenceuserblacklists`
(
    `id`          int unsigned      NOT NULL AUTO_INCREMENT,
    `users_id`    int unsigned      NOT NULL
        COMMENT 'RELATION to glpi_users(id)',
    `plugin_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci;

CREATE TABLE `glpi_plugin_mydashboard_stockwidgets`
(
    `id`              int unsigned                              NOT NULL AUTO_INCREMENT,
    `entities_id`     int unsigned                              NOT NULL DEFAULT '0',
    `is_recursive`    tinyint                           NOT NULL DEFAULT '0',
    `name`            VARCHAR(255)                         NOT NULL,
    `states`          longtext COLLATE utf8_unicode_ci              DEFAULT NULL,
    `itemtype`        VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL
        COMMENT 'see .class.php file',
    `icon`            VARCHAR(255)                         NOT NULL,
    `types`           longtext COLLATE utf8_unicode_ci              DEFAULT NULL,
    `alarm_threshold` int unsigned                              NOT NULL DEFAULT '5',
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `entities_id` (`entities_id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci
    AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `glpi_plugin_mydashboard_customswidgets`;
CREATE TABLE `glpi_plugin_mydashboard_customswidgets`
(
    `id`      int unsigned      NOT NULL AUTO_INCREMENT,
    `name`    varchar(255) NOT NULL,
    `comment` text COLLATE utf8_unicode_ci default NULL,
    `content` TEXT         NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8
    COLLATE = utf8_unicode_ci
    AUTO_INCREMENT = 1;
