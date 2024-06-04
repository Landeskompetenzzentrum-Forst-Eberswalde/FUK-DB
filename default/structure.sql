---- ADD SENSOR DB

CREATE SCHEMA IF NOT EXISTS private_meta;
GRANT USAGE ON SCHEMA private_meta TO webuser;

CREATE TABLE private_meta.channels(

       id BIGSERIAL PRIMARY KEY,
       name VARCHAR(255) NOT NULL
);

COMMENT ON TABLE private_meta.channels IS 'Table for channel meta data';
COMMENT ON COLUMN private_meta.channels.id IS 'Unique identifier for the channel';
COMMENT ON COLUMN private_meta.channels.name IS 'Name of the channel';

ALTER TABLE private_meta.channels OWNER TO postgres;


---- ADD MEASUREMENTS DB

CREATE SCHEMA IF NOT EXISTS public_inbox;
GRANT USAGE ON SCHEMA public_inbox TO webuser;

CREATE TABLE IF NOT EXISTS  public_inbox.measurements(
    id BIGSERIAL PRIMARY KEY,
    channel_id BIGSERIAL NOT NULL,
    unixtime timestamp NOT NULL,
    data float NULL
);

COMMENT ON TABLE public_inbox.measurements IS 'Table for storing measurements';
COMMENT ON COLUMN public_inbox.measurements.id IS 'Unique identifier for the measurement';
COMMENT ON COLUMN public_inbox.measurements.channel_id IS 'Unique identifier for the channel';
COMMENT ON COLUMN public_inbox.measurements.unixtime IS 'Time of the measurement';
COMMENT ON COLUMN public_inbox.measurements.data IS 'Value of the measurement';

ALTER TABLE public_inbox.measurements ADD CONSTRAINT FK_Measurements_Channels FOREIGN KEY (channel_id) REFERENCES private_meta.channels (id);

ALTER TABLE public_inbox.measurements OWNER TO postgres;
GRANT SELECT ON TABLE public_inbox.measurements TO webuser;

-- OUTBOX view

CREATE SCHEMA IF NOT EXISTS public_outbox;