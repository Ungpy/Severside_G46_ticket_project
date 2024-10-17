--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-17 15:22:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5010 (class 0 OID 17136)
-- Dependencies: 217
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group VALUES (1, 'Member_normal');
INSERT INTO public.auth_group VALUES (2, 'Employee');


--
-- TOC entry 5024 (class 0 OID 17169)
-- Dependencies: 231
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'tickets', 'locationtype');
INSERT INTO public.django_content_type VALUES (8, 'tickets', 'employee');
INSERT INTO public.django_content_type VALUES (9, 'tickets', 'event');
INSERT INTO public.django_content_type VALUES (10, 'tickets', 'location');
INSERT INTO public.django_content_type VALUES (11, 'tickets', 'payment');
INSERT INTO public.django_content_type VALUES (12, 'tickets', 'ticket');
INSERT INTO public.django_content_type VALUES (13, 'tickets', 'memberinfo');


--
-- TOC entry 5014 (class 0 OID 17144)
-- Dependencies: 221
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add location type', 7, 'add_locationtype');
INSERT INTO public.auth_permission VALUES (26, 'Can change location type', 7, 'change_locationtype');
INSERT INTO public.auth_permission VALUES (27, 'Can delete location type', 7, 'delete_locationtype');
INSERT INTO public.auth_permission VALUES (28, 'Can view location type', 7, 'view_locationtype');
INSERT INTO public.auth_permission VALUES (29, 'Can add employee', 8, 'add_employee');
INSERT INTO public.auth_permission VALUES (30, 'Can change employee', 8, 'change_employee');
INSERT INTO public.auth_permission VALUES (31, 'Can delete employee', 8, 'delete_employee');
INSERT INTO public.auth_permission VALUES (32, 'Can view employee', 8, 'view_employee');
INSERT INTO public.auth_permission VALUES (33, 'Can add event', 9, 'add_event');
INSERT INTO public.auth_permission VALUES (34, 'Can change event', 9, 'change_event');
INSERT INTO public.auth_permission VALUES (35, 'Can delete event', 9, 'delete_event');
INSERT INTO public.auth_permission VALUES (36, 'Can view event', 9, 'view_event');
INSERT INTO public.auth_permission VALUES (37, 'Can add location', 10, 'add_location');
INSERT INTO public.auth_permission VALUES (38, 'Can change location', 10, 'change_location');
INSERT INTO public.auth_permission VALUES (39, 'Can delete location', 10, 'delete_location');
INSERT INTO public.auth_permission VALUES (40, 'Can view location', 10, 'view_location');
INSERT INTO public.auth_permission VALUES (41, 'Can add payment', 11, 'add_payment');
INSERT INTO public.auth_permission VALUES (42, 'Can change payment', 11, 'change_payment');
INSERT INTO public.auth_permission VALUES (43, 'Can delete payment', 11, 'delete_payment');
INSERT INTO public.auth_permission VALUES (44, 'Can view payment', 11, 'view_payment');
INSERT INTO public.auth_permission VALUES (45, 'Can add ticket', 12, 'add_ticket');
INSERT INTO public.auth_permission VALUES (46, 'Can change ticket', 12, 'change_ticket');
INSERT INTO public.auth_permission VALUES (47, 'Can delete ticket', 12, 'delete_ticket');
INSERT INTO public.auth_permission VALUES (48, 'Can view ticket', 12, 'view_ticket');
INSERT INTO public.auth_permission VALUES (49, 'Can add member info', 13, 'add_memberinfo');
INSERT INTO public.auth_permission VALUES (50, 'Can change member info', 13, 'change_memberinfo');
INSERT INTO public.auth_permission VALUES (51, 'Can delete member info', 13, 'delete_memberinfo');
INSERT INTO public.auth_permission VALUES (52, 'Can view member info', 13, 'view_memberinfo');
INSERT INTO public.auth_permission VALUES (53, 'Can Manage Event', 9, 'manage_event');


--
-- TOC entry 5012 (class 0 OID 17140)
-- Dependencies: 219
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_permissions VALUES (1, 1, 33);
INSERT INTO public.auth_group_permissions VALUES (4, 1, 36);
INSERT INTO public.auth_group_permissions VALUES (5, 1, 45);
INSERT INTO public.auth_group_permissions VALUES (6, 1, 46);
INSERT INTO public.auth_group_permissions VALUES (7, 1, 47);
INSERT INTO public.auth_group_permissions VALUES (10, 2, 36);
INSERT INTO public.auth_group_permissions VALUES (11, 2, 37);
INSERT INTO public.auth_group_permissions VALUES (12, 2, 38);
INSERT INTO public.auth_group_permissions VALUES (13, 2, 39);
INSERT INTO public.auth_group_permissions VALUES (14, 2, 40);
INSERT INTO public.auth_group_permissions VALUES (15, 2, 44);
INSERT INTO public.auth_group_permissions VALUES (17, 2, 25);
INSERT INTO public.auth_group_permissions VALUES (18, 2, 26);
INSERT INTO public.auth_group_permissions VALUES (19, 2, 27);
INSERT INTO public.auth_group_permissions VALUES (20, 2, 28);
INSERT INTO public.auth_group_permissions VALUES (21, 1, 16);
INSERT INTO public.auth_group_permissions VALUES (22, 1, 14);
INSERT INTO public.auth_group_permissions VALUES (23, 2, 53);
INSERT INTO public.auth_group_permissions VALUES (24, 2, 16);
INSERT INTO public.auth_group_permissions VALUES (25, 2, 14);
INSERT INTO public.auth_group_permissions VALUES (26, 1, 48);


--
-- TOC entry 5016 (class 0 OID 17148)
-- Dependencies: 223
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user VALUES (2, 'pbkdf2_sha256$870000$5R4gVTs55gqJqeYZmUEoWI$u2nK45YYlolIz7C6roxaReaTJ759kwyrenT9CT3QYLA=', '2024-10-14 07:23:09.690239+07', false, 'ame', 'Tanadonn', 'DekDeeeeee', 'amedekdee@gmail.com', false, true, '2024-10-14 01:29:28.409529+07');
INSERT INTO public.auth_user VALUES (4, 'pbkdf2_sha256$870000$yfB2WjiFBdKeTCwYfHprBh$Wyop3cFDmNlaH6Zso3dabH0AmHtYHauUdf6FNDsMweI=', '2024-10-17 14:56:54.632717+07', false, 'timdp', 'Kopisuttt', 'Chalee', 'timdp@gmail.com', false, true, '2024-10-14 06:15:37.469759+07');
INSERT INTO public.auth_user VALUES (11, 'pbkdf2_sha256$870000$pnotLJzAQ5YOPHbRSWKnQp$AYA33VK8kTOw97ciNbjKrrGcjMHCbUJmpoUtdwbSVM0=', '2024-10-17 14:57:40.746708+07', false, 'staff', 'Pao', 'Paramet', 'staffpao@gmail.com', false, true, '2024-10-17 00:42:32+07');
INSERT INTO public.auth_user VALUES (9, 'pbkdf2_sha256$870000$HbspjvZKhC2Btmg3GnkbyI$amgfkQvyvEA1Ui2VRUu/HX6r9TrC4Hy107a5LeyBWvI=', NULL, false, 'staff01', 'staff', 'first', 's@s.com', false, true, '2024-10-17 00:08:52+07');
INSERT INTO public.auth_user VALUES (6, 'pbkdf2_sha256$870000$cM5WLAH95akRCHMANpOVoG$/yxfGO/705xmzdAN61/ZrbTtkTdMHqK0+66ieooCa7k=', '2024-10-14 07:45:10+07', false, 'staff1', 'jirachot', 'intharawong', 'ji@gmail.com', true, true, '2024-10-14 07:44:18+07');
INSERT INTO public.auth_user VALUES (3, 'pbkdf2_sha256$870000$83pMqwzRru5q4B6DVyvSaL$+rdIA/U+/jy9RCFkEVSBbRXoQqnR4bS29Ur1UqEQTdU=', NULL, false, 'aay', '', '', '', false, true, '2024-10-14 06:14:00+07');
INSERT INTO public.auth_user VALUES (8, 'pbkdf2_sha256$870000$rIXBNZo7cnYhBduI7NdRoY$CmOClOsyFFM7pRbwvoQGOHse770TInJfEynvdb7+4K8=', '2024-10-17 01:57:19.707652+07', false, 'user1', 'Somsak', 'Swang', 'd@d.com', false, true, '2024-10-16 23:51:53.213094+07');
INSERT INTO public.auth_user VALUES (10, 'pbkdf2_sha256$870000$n9lctVoX5V91Tmu9KtMI7k$/p9RMqqTkltvw08HdqP9l66879c1jmYi2xjJUOwNoj4=', '2024-10-17 01:59:37.519438+07', false, 'staff2', 'staff2', 'second', 's@s.com', true, true, '2024-10-17 00:12:31+07');
INSERT INTO public.auth_user VALUES (12, 'pbkdf2_sha256$870000$kpKgHNZx6GRFpM4yw9zgjV$a992A144fjR97OVYClu83xFxAu7APBUvlnMVtOlMHO4=', NULL, false, 'Pb12vc', 'Pao P', 'Naja', 's@s.com', false, true, '2024-10-17 02:19:20.693932+07');
INSERT INTO public.auth_user VALUES (13, 'pbkdf2_sha256$870000$KGcBaaa8Vy8hhi3V2q2Qtd$xTJQZx3jbDVCIIwfxfSew6dOBDCRcDkLLJzkwxnIpaY=', NULL, false, 'Pb12vc2', 'P ao@!@5', 'Naja', 's@s.com', false, true, '2024-10-17 02:32:22.34066+07');
INSERT INTO public.auth_user VALUES (14, 'pbkdf2_sha256$870000$Qyk3SYfHIksp1fY9kGCVLQ$jnfnLRLQv40mrtq5T6R+g8SAP9VKilLocJReUpsqri4=', NULL, false, 'pb12', 'paso', '', 'dassda@gmail.com', false, true, '2024-10-17 02:33:45.115905+07');
INSERT INTO public.auth_user VALUES (15, 'pbkdf2_sha256$870000$fc2LUTg6N6pcpgm6PteHx9$zUukATg2tpfcY7kzrUp6MOlYSa25oJ0lgewGV/SsnNw=', NULL, false, 'pv', '@13#41234', '123131', 'ok@gmail.com', false, true, '2024-10-17 02:34:53.0502+07');
INSERT INTO public.auth_user VALUES (16, 'pbkdf2_sha256$870000$l5X4sP3AChHaQXFiogrYrc$Z0nh7NaWKPav5SX+oO681MTJig07wuoXEkWZDZ+ssMs=', NULL, false, 'wdqdqw', 'wdd', 'wdd', 'wdd@gmail.com', false, true, '2024-10-17 02:35:40.459024+07');
INSERT INTO public.auth_user VALUES (17, 'pbkdf2_sha256$870000$guo2VxE5DBqcPUaqzHPBqf$og7MpU5XO7VSfJUnKI/l1Bnnydhaq3GYfka1T5feK7Y=', NULL, false, 'dddddddddddddddd', '', '', 'dd@gmail.com', false, true, '2024-10-17 02:38:15.855186+07');
INSERT INTO public.auth_user VALUES (18, 'pbkdf2_sha256$870000$OrLNy5DpvcdJz76l6tgZ6n$4eF07k7aqMifuarPDTOnag3QAXAfMm919ZjQa7bSTgw=', NULL, false, 'khunlol', 'ddd', '', 'k@gmail.com', false, true, '2024-10-17 02:41:06.513183+07');
INSERT INTO public.auth_user VALUES (19, 'pbkdf2_sha256$870000$ND5LEmVR4CMblJKTn6WyWG$aii5MrG83fw8OR/Mp1LsqLtbDySP7MNIWnVJCLe0gOo=', NULL, false, 'Pb12vc3', 'Mddd', '', 's@s.com', false, true, '2024-10-17 02:41:48.290693+07');
INSERT INTO public.auth_user VALUES (20, 'pbkdf2_sha256$870000$iuMxp8tpc6oOz1GQmaGysh$9BOvsl/BPdc7h6JT4F0O7rLd8k8Vx1HgCuIQbBKu5l8=', NULL, false, 'dddddddaasd', 'dfsfsd', 'dadsdasd', 'asdaw@gmail.com', false, true, '2024-10-17 02:43:03.404705+07');
INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$870000$M8VpF6yRtoRbpqZHbOF5vH$4Pnuqu5mg4tyelfu7uKfhXQ0Y8qMg7opB5vujfxv6Zo=', '2024-10-17 03:23:48.123186+07', true, 'miku', '', '', '', true, true, '2024-10-13 22:03:55.478097+07');


--
-- TOC entry 5017 (class 0 OID 17153)
-- Dependencies: 224
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user_groups VALUES (1, 2, 1);
INSERT INTO public.auth_user_groups VALUES (2, 3, 1);
INSERT INTO public.auth_user_groups VALUES (3, 4, 1);
INSERT INTO public.auth_user_groups VALUES (6, 6, 2);
INSERT INTO public.auth_user_groups VALUES (8, 8, 1);
INSERT INTO public.auth_user_groups VALUES (12, 11, 2);
INSERT INTO public.auth_user_groups VALUES (13, 9, 2);
INSERT INTO public.auth_user_groups VALUES (14, 10, 2);
INSERT INTO public.auth_user_groups VALUES (15, 12, 1);
INSERT INTO public.auth_user_groups VALUES (16, 13, 1);
INSERT INTO public.auth_user_groups VALUES (17, 14, 1);
INSERT INTO public.auth_user_groups VALUES (18, 15, 1);
INSERT INTO public.auth_user_groups VALUES (19, 16, 1);
INSERT INTO public.auth_user_groups VALUES (20, 17, 1);
INSERT INTO public.auth_user_groups VALUES (21, 18, 1);
INSERT INTO public.auth_user_groups VALUES (22, 19, 1);
INSERT INTO public.auth_user_groups VALUES (23, 20, 1);


--
-- TOC entry 5020 (class 0 OID 17158)
-- Dependencies: 227
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5022 (class 0 OID 17162)
-- Dependencies: 229
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log VALUES (1, '2024-10-13 22:17:22.495284+07', '1', 'Member_normal', 1, '[{"added": {}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (2, '2024-10-13 22:18:11.76583+07', '2', 'Employee', 1, '[{"added": {}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (3, '2024-10-13 22:20:48.506572+07', '2', 'Employee', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (4, '2024-10-13 23:32:17.046443+07', '53', 'Tickets | event | Can Manage Event', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (5, '2024-10-13 23:32:32.034719+07', '53', 'Tickets | event | Can Manage Event', 2, '[{"changed": {"fields": ["Codename"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (6, '2024-10-14 03:07:53.82949+07', '1', 'Member_normal', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (7, '2024-10-14 03:15:13.930192+07', '1', 'Member_normal', 2, '[]', 3, 1);
INSERT INTO public.django_admin_log VALUES (8, '2024-10-14 06:14:00.445567+07', '3', 'aay', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (9, '2024-10-14 06:14:09.396217+07', '3', 'aay', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (10, '2024-10-14 07:38:20.38044+07', '5', 'staff', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (11, '2024-10-14 07:38:24.575095+07', '5', 'staff', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (12, '2024-10-14 07:39:29.213946+07', '2', 'Employee', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (13, '2024-10-14 07:42:46.482927+07', '2', 'Employee', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (14, '2024-10-14 07:44:44.421388+07', '6', 'staff1', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (15, '2024-10-16 22:18:13.84995+07', '5', 'staff', 3, '', 4, 1);
INSERT INTO public.django_admin_log VALUES (16, '2024-10-16 22:18:44.221374+07', '7', 'staff', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (17, '2024-10-16 22:18:50.089222+07', '7', 'staff', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (18, '2024-10-17 00:42:24.200736+07', '7', 'staff', 3, '', 4, 1);
INSERT INTO public.django_admin_log VALUES (19, '2024-10-17 00:43:14.212567+07', '11', 'staff', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (20, '2024-10-17 01:07:53.245452+07', '9', 'staff01', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (21, '2024-10-17 01:08:28.387894+07', '6', 'staff1', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (22, '2024-10-17 01:08:39.232369+07', '10', 'staff2', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (23, '2024-10-17 01:08:55.763737+07', '10', 'staff2', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (24, '2024-10-17 01:55:33.547297+07', '2', 'Employee', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (25, '2024-10-17 01:55:48.888899+07', '1', 'Member_normal', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (26, '2024-10-17 03:24:37.665164+07', '1', 'Member_normal', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (27, '2024-10-17 03:24:58.038038+07', '2', 'Employee', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (28, '2024-10-17 03:26:41.836216+07', '2', 'Employee', 2, '[]', 3, 1);
INSERT INTO public.django_admin_log VALUES (29, '2024-10-17 03:26:41.901938+07', '2', 'Employee', 2, '[]', 3, 1);
INSERT INTO public.django_admin_log VALUES (30, '2024-10-17 03:26:41.904942+07', '2', 'Employee', 2, '[]', 3, 1);
INSERT INTO public.django_admin_log VALUES (31, '2024-10-17 03:26:41.955479+07', '2', 'Employee', 2, '[]', 3, 1);


--
-- TOC entry 5026 (class 0 OID 17173)
-- Dependencies: 233
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2024-10-13 22:02:52.461982+07');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2024-10-13 22:02:52.511913+07');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2024-10-13 22:02:52.526014+07');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-10-13 22:02:52.532141+07');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-13 22:02:52.536673+07');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-10-13 22:02:52.548217+07');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-10-13 22:02:52.553725+07');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-10-13 22:02:52.558983+07');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-10-13 22:02:52.563529+07');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-10-13 22:02:52.569522+07');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-10-13 22:02:52.570512+07');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-13 22:02:52.57667+07');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-10-13 22:02:52.585191+07');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-13 22:02:52.5902+07');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-10-13 22:02:52.597711+07');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-10-13 22:02:52.602236+07');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-13 22:02:52.607247+07');
INSERT INTO public.django_migrations VALUES (18, 'sessions', '0001_initial', '2024-10-13 22:02:52.614771+07');
INSERT INTO public.django_migrations VALUES (19, 'tickets', '0001_initial', '2024-10-13 22:02:52.6722+07');
INSERT INTO public.django_migrations VALUES (20, 'tickets', '0002_alter_payments_member', '2024-10-13 22:02:52.6808+07');
INSERT INTO public.django_migrations VALUES (21, 'tickets', '0003_locations_location_type', '2024-10-13 22:02:52.69132+07');
INSERT INTO public.django_migrations VALUES (22, 'tickets', '0004_events_cover_image', '2024-10-13 22:02:52.698514+07');
INSERT INTO public.django_migrations VALUES (23, 'tickets', '0005_rename_events_event_rename_locations_location_and_more', '2024-10-13 22:02:52.782693+07');
INSERT INTO public.django_migrations VALUES (24, 'tickets', '0006_alter_event_event_status', '2024-10-13 22:02:52.789738+07');
INSERT INTO public.django_migrations VALUES (25, 'tickets', '0007_memberinfo', '2024-10-13 22:02:52.804282+07');
INSERT INTO public.django_migrations VALUES (26, 'tickets', '0008_location_cover_image', '2024-10-13 23:51:56.692362+07');
INSERT INTO public.django_migrations VALUES (27, 'tickets', '0009_memberinfo_ticket_delete_payment', '2024-10-14 02:16:45.247344+07');
INSERT INTO public.django_migrations VALUES (28, 'tickets', '0010_ticket_amount', '2024-10-14 02:29:29.789561+07');


--
-- TOC entry 5028 (class 0 OID 17179)
-- Dependencies: 235
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session VALUES ('5pd9zdaleniadtyn219pcpp04h0yhwwh', '.eJxVjEEOwiAUBe_C2hAghYJL956BPPgfqRqalHZlvLs26UK3b2beS0Rsa41b5yVOJM5Ci9PvlpAf3HZAd7TbLPPc1mVKclfkQbu8zsTPy-H-HVT0-q0NmIxCYSLLinPJCBwcJzXQCG2VQzEBrIcyOpsB9uyVVzC65EAk3h8ugDml:1t008m:ud3G3fVuxtrE7MyofoIhg-QurmjKWYnPdoNbtXCDoco', '2024-10-27 22:04:16.870496+07');
INSERT INTO public.django_session VALUES ('4sdabgei07fgcw46sx5br7r6bwxw5bpb', '.eJxVjDsOwjAQBe_iGlmxN1lsSvqcIfJ-ggPIlvKpEHeHSCmgfTPzXmZI25qHbdF5mMRcTGtOvxslfmjZgdxTuVXLtazzRHZX7EEX21fR5_Vw_w5yWvK3RorkpAkEAq0guMjOo8KoQC033gFqoE7pnMSPPGKAGJCjinTqsDPvD-okOD0:1t18uJ:b9Wg8zLP7IBmFVcWsARL22-DmW4lVr6_EKHo4itdbsw', '2024-10-31 01:38:03.04654+07');
INSERT INTO public.django_session VALUES ('iul8g4p16ejq2cj1b9llgn0u5n8ythfq', '.eJxVjEEOgjAQRe_StWlmoC3UpXvPQKYzHUFNSSisjHdXEha6_e-9_zIDbes4bDUvwyTmbBDN6XdMxI9cdiJ3KrfZ8lzWZUp2V-xBq73Okp-Xw_07GKmO3zo00GCKBNKBT4HRYU4UyIm0rJp74RaQfXIROiUF9czYaWQfWUNv3h8Vvjjm:1t19wt:-USjPY9-Zt7LlQTKO1shV3fJGeIOgoICpSSd_OaC_hU', '2024-10-31 02:44:47.922221+07');
INSERT INTO public.django_session VALUES ('4piq5iy9n0r7xlc9gpubl0t6aw8nhcgp', '.eJxVjEEOwiAUBe_C2hAghYJL956BPPgfqRqalHZlvLs26UK3b2beS0Rsa41b5yVOJM5Ci9PvlpAf3HZAd7TbLPPc1mVKclfkQbu8zsTPy-H-HVT0-q0NmIxCYSLLinPJCBwcJzXQCG2VQzEBrIcyOpsB9uyVVzC65EAk3h8ugDml:1t1AYe:68eIWUExLnf6pSoMG8u5NGKmEkgMGdbRBVry1HY9oi4', '2024-10-31 03:23:48.124186+07');
INSERT INTO public.django_session VALUES ('fwq1bwa1a30mzam788gengca2x05nlb5', '.eJxVjDsOwjAQBe_iGlmxN1lsSvqcIfJ-ggPIlvKpEHeHSCmgfTPzXmZI25qHbdF5mMRcTGtOvxslfmjZgdxTuVXLtazzRHZX7EEX21fR5_Vw_w5yWvK3RorkpAkEAq0guMjOo8KoQC033gFqoE7pnMSPPGKAGJCjinTqsDPvD-okOD0:1t1LNO:KmpmKlWWprAmv4qqBHmlrZd0UFi1nm_o6OTA3GOnLyE', '2024-10-31 14:56:54.638266+07');
INSERT INTO public.django_session VALUES ('zfa6log62rax8shghyqvw3lo9upp6urw', '.eJxVjEEOgjAQRe_StWlmoC3UpXvPQKYzHUFNSSisjHdXEha6_e-9_zIDbes4bDUvwyTmbBDN6XdMxI9cdiJ3KrfZ8lzWZUp2V-xBq73Okp-Xw_07GKmO3zo00GCKBNKBT4HRYU4UyIm0rJp74RaQfXIROiUF9czYaWQfWUNv3h8Vvjjm:1t1LO8:iY-YNSaiIXUC-4xvznuJtH_KnPH95dm9dEnkaEgY_uc', '2024-10-31 14:57:40.746708+07');
INSERT INTO public.django_session VALUES ('2v0qbhe44acnwwmuawrgyuj9j4fyn994', '.eJxVjEEOwiAQRe_C2hBCYWhduvcMZGYYpGogKe3KeHdt0oVu_3vvv1TEbS1x67LEOamzsur0uxHyQ-oO0h3rrWludV1m0ruiD9r1tSV5Xg7376BgL98aIUkIA6dRDDFkzOIFPQCy5NGQsyhAaQJhAD8Ea4xzbCYm42xgp94fIRo4vg:1t08rd:Q5b2LlCxoV01O2mlrS3eUhz_by40p_JbXYuJ8M8ZfzM', '2024-10-28 07:23:09.6915+07');
INSERT INTO public.django_session VALUES ('x28efxs44ydzuwf3rkfqkpcinis5n4cr', '.eJxVjEEOwiAURO_C2pAPtIW4dO8ZyPR_KlUDSWlXxrtrky50O--9eamIbc1xa2mJs6izGtTpdxvBj1R2IHeUW9Vcy7rMo94VfdCmr1XS83K4fwcZLX9rmrpgneuBkb2Dd4GkAzM609PAEJpsghn8RMabYOHFwrCIDQTyQb0_5fg31w:1t09Cw:ExfFUmlPnchX9V__uPMIdC-y6Kjkae_XutzVjUPsfe0', '2024-10-28 07:45:10.236013+07');


--
-- TOC entry 5029 (class 0 OID 17184)
-- Dependencies: 236
-- Data for Name: tickets_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5035 (class 0 OID 17198)
-- Dependencies: 242
-- Data for Name: tickets_locationtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_locationtype VALUES (1, 'Small room', 'in the small room');
INSERT INTO public.tickets_locationtype VALUES (4, 'Hall', 'หอประชุมขนาดใหญ่');
INSERT INTO public.tickets_locationtype VALUES (5, 'Classroom', 'ห้องเรียน');
INSERT INTO public.tickets_locationtype VALUES (6, 'Meeting Room', 'ห้องขนาดกลางสำหรับจัดงาน 20-30 คน');
INSERT INTO public.tickets_locationtype VALUES (7, 'ลานโล่ง', 'สถานที่กลางเเจ้ง');


--
-- TOC entry 5033 (class 0 OID 17194)
-- Dependencies: 240
-- Data for Name: tickets_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_location VALUES (8, 'ห้องประชุม 1', 'ห้องขนาด 20 คน', 20, 1000.00, 1, 'images/location/Meeting.jpg');
INSERT INTO public.tickets_location VALUES (9, 'Hall', 'ฮอลด์จัดงาน', 500, 10000.00, 4, 'images/location/Hall.jpg');
INSERT INTO public.tickets_location VALUES (11, 'ลาน Pao', 'ลานโล่งข้างๆตึกทิศตะวันตก', 100, 1000.00, 7, 'images/location/paofield.jpg');
INSERT INTO public.tickets_location VALUES (12, 'ลานริมสระ', 'ลานกว้างข้างเเหล่งน้ำ', 100, 2000.00, 7, 'images/location/swimfield.jpg');
INSERT INTO public.tickets_location VALUES (13, 'ห้องเรียน', '-', 30, 100.00, 5, 'images/location/20210825_151313.jpg');


--
-- TOC entry 5031 (class 0 OID 17188)
-- Dependencies: 238
-- Data for Name: tickets_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_event VALUES (18, 'Fercon', 'convention event for people who interesting', '2024-10-18 08:05:00+07', '2024-10-19 08:05:00+07', 'APPROVED', 10, 2, 8, 'images/Hall.jpg');
INSERT INTO public.tickets_event VALUES (19, 'Meet Senior', 'พบปะกับพี่ๆมืออาชีพจากบริษัทดัง', '2024-10-17 20:00:00+07', '2024-10-22 23:00:00+07', 'DENIED', 10, 10, 9, 'images/premium_photo-1661380853137-39299fc23a2a.jpg');
INSERT INTO public.tickets_event VALUES (21, 'Pool party meeting', 'สำหรับคนที่สนใจประชุมก่อนงานปาร์ตี้ริมสระ', '2024-11-06 20:30:00+07', '2024-11-06 23:30:00+07', 'PENDING', NULL, 2, 12, 'images/81-VxjI3bqL._AC_UF8941000_QL80_.jpg');
INSERT INTO public.tickets_event VALUES (22, 'Commit Sucide Events', 'สำหรับคนที่ขก เเล้วอยากหาทางออกง่ายๆนะครับ สิ่งที่ต้องทำก็เเค่เตรียมใจเเละเชือกมาเท่านั้นก็พอครับ

Ticket:
Normal : ฟรี เเต่ไม่มีอุปกรณ์ให้
Premium : 200 พร้อม อาหารมื้อสุดท้าย + เชือกคุณภาพดีเยี่ยม รับประกันโดย Kill my self agency', '2024-10-20 17:00:00+07', '2024-10-20 18:00:00+07', 'PENDING', NULL, 2, 11, 'images/istockphoto-1265400079-612x612.jpg');
INSERT INTO public.tickets_event VALUES (24, 'หมูในหม้อ', 'ประชุมเรื่องการไปทานร้านชาบูของกลุ่มคนที่สนใจครับ!', '2024-11-02 17:00:00+07', '2024-11-02 18:29:00+07', 'PENDING', NULL, 4, 13, 'images/1490594729_18e2999891374a475d0687ca9f989d83.jpg');
INSERT INTO public.tickets_event VALUES (26, 'Jazz Music Consort 2024', 'JAZZ lover', '2024-10-24 17:00:00+07', '2024-10-25 00:00:00+07', 'PENDING', NULL, 2, 12, 'images/images.jpg');
INSERT INTO public.tickets_event VALUES (27, 'Pain Suffer', 'อยากกลับบ้าน', '2024-10-17 01:51:00+07', '2024-10-22 08:51:00+07', 'APPROVED', 11, 4, 9, 'images/201701_SRT_CNR_Second_Class_Sleeper_Coaches_as_023_at_Bangkok_Station.jpg');
INSERT INTO public.tickets_event VALUES (15, 'งานวัด', 'วันปีใหม่', '2024-10-17 07:16:00+07', '2024-10-17 09:16:00+07', 'DENIED', 11, 1, 9, '');
INSERT INTO public.tickets_event VALUES (17, 'ประชุม', 'วันนี้เที่ยงนะครับ', '2024-10-18 07:43:00+07', '2024-10-18 07:59:00+07', 'APPROVED', 10, 8, 8, 'images/D1028_55_689_1200.jpg');
INSERT INTO public.tickets_event VALUES (25, 'TGS 2024', 'game event', '2024-10-25 20:45:00+07', '2024-11-01 00:45:00+07', 'APPROVED', 11, 4, 9, 'images/Content-Warning.url-1.png');
INSERT INTO public.tickets_event VALUES (23, 'เบียวสงคราม meeting IV', 'สำหรับคนที่สนใจคุยทุกอย่างที่เกี่ยวกับสงครามครับ', '2024-11-01 20:00:00+07', '2024-11-01 22:00:00+07', 'DENIED', 11, 4, 11, 'images/J._M._Flagg_I_Want_You_for_U.S._Army_poster_1917.jpg');
INSERT INTO public.tickets_event VALUES (28, 'ttt', 'tsdfsf', '2024-11-09 11:23:00+07', '2024-11-09 13:23:00+07', 'DENIED', 11, 2, 9, 'images/Content-Warning_XooGJgt.url-1.png');


--
-- TOC entry 5037 (class 0 OID 17204)
-- Dependencies: 244
-- Data for Name: tickets_memberinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_memberinfo VALUES (3, 'M', 'House', 'xxxxxxxxxx', 6);
INSERT INTO public.tickets_memberinfo VALUES (4, 'M', 'ไม่บอก', 'ก', 8);
INSERT INTO public.tickets_memberinfo VALUES (5, 'F', 'wwwww', '0325648972', 9);
INSERT INTO public.tickets_memberinfo VALUES (6, 'M', 'Passaa+1234', '0326597535', 10);
INSERT INTO public.tickets_memberinfo VALUES (7, 'M', 'Home', '0111231234', 11);
INSERT INTO public.tickets_memberinfo VALUES (8, 'OTHER', '55555', '0256489756', 12);
INSERT INTO public.tickets_memberinfo VALUES (9, 'OTHER', '55555', '0256489756', 13);
INSERT INTO public.tickets_memberinfo VALUES (10, 'F', 'dassasd', '0123412345', 14);
INSERT INTO public.tickets_memberinfo VALUES (11, 'M', 'dasd', '0122222222', 15);
INSERT INTO public.tickets_memberinfo VALUES (12, 'M', 'dassd', '0222222222', 16);
INSERT INTO public.tickets_memberinfo VALUES (13, 'M', 'dasad', '0111111111', 17);
INSERT INTO public.tickets_memberinfo VALUES (14, 'M', 'dadassd', '0421242222', 18);
INSERT INTO public.tickets_memberinfo VALUES (15, 'OTHER', '55555', '0256489756', 19);
INSERT INTO public.tickets_memberinfo VALUES (16, 'M', 'dasda', '0121212121', 20);
INSERT INTO public.tickets_memberinfo VALUES (2, 'M', 'dasdasdadad', '0888888888', 4);
INSERT INTO public.tickets_memberinfo VALUES (1, 'M', 'บ้านอ้าย', '0112122121', 2);


--
-- TOC entry 5039 (class 0 OID 17212)
-- Dependencies: 246
-- Data for Name: tickets_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_ticket VALUES (41, 'tt', 2.00, 28, 3);
INSERT INTO public.tickets_ticket VALUES (42, 't', 3.00, 28, 4);
INSERT INTO public.tickets_ticket VALUES (22, 'ประธาน', 200000.00, 17, 1);
INSERT INTO public.tickets_ticket VALUES (26, 'ผู้เข้าชม', 250.00, 19, 15);
INSERT INTO public.tickets_ticket VALUES (28, 'Member', 0.00, 21, 10);
INSERT INTO public.tickets_ticket VALUES (29, 'VIP', 200.00, 21, 5);
INSERT INTO public.tickets_ticket VALUES (30, 'Normal', 0.00, 22, 15);
INSERT INTO public.tickets_ticket VALUES (31, 'Premium', 200.00, 22, 5);
INSERT INTO public.tickets_ticket VALUES (32, 'เบียว', 0.00, 23, 100);
INSERT INTO public.tickets_ticket VALUES (33, '299', 0.00, 24, 20);
INSERT INTO public.tickets_ticket VALUES (34, '399', 0.00, 24, 20);
INSERT INTO public.tickets_ticket VALUES (35, 'Normal', 100.00, 25, 1000);
INSERT INTO public.tickets_ticket VALUES (38, 'Normal', 0.00, 26, 100);
INSERT INTO public.tickets_ticket VALUES (40, 'เตียงล่าง', 959.00, 27, 10);
INSERT INTO public.tickets_ticket VALUES (39, 'เตียงบน', 859.00, 27, 10);
INSERT INTO public.tickets_ticket VALUES (25, 'Platinum', 1500.00, 18, 0);
INSERT INTO public.tickets_ticket VALUES (24, 'Gold', 500.00, 18, 8);
INSERT INTO public.tickets_ticket VALUES (23, 'Silver', 200.00, 18, 7);
INSERT INTO public.tickets_ticket VALUES (36, '1 Day Pass', 500.00, 25, 999);
INSERT INTO public.tickets_ticket VALUES (37, 'Premium', 1000.00, 25, 499);


--
-- TOC entry 5042 (class 0 OID 17379)
-- Dependencies: 249
-- Data for Name: tickets_memberinfo_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets_memberinfo_ticket VALUES (20, 6, 23);
INSERT INTO public.tickets_memberinfo_ticket VALUES (28, 1, 24);
INSERT INTO public.tickets_memberinfo_ticket VALUES (29, 1, 23);
INSERT INTO public.tickets_memberinfo_ticket VALUES (30, 1, 36);
INSERT INTO public.tickets_memberinfo_ticket VALUES (31, 1, 37);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 26, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 53, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 23, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 20, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 230
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 31, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 237
-- Name: tickets_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_employee_id_seq', 1, false);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 239
-- Name: tickets_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_events_id_seq', 28, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 241
-- Name: tickets_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_locations_id_seq', 13, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 243
-- Name: tickets_locationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_locationtype_id_seq', 7, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 245
-- Name: tickets_memberinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_memberinfo_id_seq', 16, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 248
-- Name: tickets_memberinfo_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_memberinfo_ticket_id_seq', 31, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 247
-- Name: tickets_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_tickets_id_seq', 42, true);


-- Completed on 2024-10-17 15:22:52

--
-- PostgreSQL database dump complete
--

