-- This file is used to initialize the database with some data

INSERT INTO private_meta.channels (name) VALUES ('temperature');
INSERT INTO private_meta.channels (name) VALUES ('humidity');
INSERT INTO private_meta.channels (name) VALUES ('pressure');


-- INSERT some temperature data

INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:00:00', 20.0);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:01:00', 20.1);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:02:00', 20.2);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:03:00', 20.3);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:04:00', 20.4);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:05:00', 20.5);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (1, '2020-01-01 00:06:00', 20.6);


-- INSERT some humidity data

INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:00:00', 50.0);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:01:00', 50.1);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:02:00', 50.2);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:03:00', 50.3);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:04:00', 50.4);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:05:00', 50.5);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (2, '2020-01-01 00:06:00', 50.6);


-- INSERT some pressure data

INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:00:00', 1000.0);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:01:00', 1000.1);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:02:00', 1000.2);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:03:00', 1000.3);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:04:00', 1000.4);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:05:00', 1000.5);
INSERT INTO public_inbox.measurements (channel_id, unixtime, data) VALUES (3, '2020-01-01 00:06:00', 1000.6);
