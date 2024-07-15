SET check_function_bodies = false;
CREATE TABLE public.episodes (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    podcast_id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_date date,
    duration integer
);
CREATE TABLE public.podcast (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    talent_id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_date date
);
CREATE TABLE public.podcast_episodes (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    podcast_id uuid NOT NULL,
    episode_id uuid NOT NULL
);
CREATE TABLE public.shows (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    talent_id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_date date
);
CREATE TABLE public.talent (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    bio text
);
CREATE TABLE public.talent_podcast (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    talent_id uuid NOT NULL,
    podcast_id uuid NOT NULL
);
CREATE TABLE public.talent_shows (
    qp_id uuid DEFAULT gen_random_uuid() NOT NULL,
    talent_id uuid NOT NULL,
    show_id uuid NOT NULL
);
ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.podcast_episodes
    ADD CONSTRAINT podcast_episodes_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.podcast
    ADD CONSTRAINT podcast_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.talent
    ADD CONSTRAINT talent_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.talent_podcast
    ADD CONSTRAINT talent_podcast_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.talent_shows
    ADD CONSTRAINT talent_shows_pkey PRIMARY KEY (qp_id);
ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_podcast_id_fkey FOREIGN KEY (podcast_id) REFERENCES public.podcast(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.podcast_episodes
    ADD CONSTRAINT podcast_episodes_episode_id_fkey FOREIGN KEY (episode_id) REFERENCES public.episodes(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.podcast_episodes
    ADD CONSTRAINT podcast_episodes_podcast_id_fkey FOREIGN KEY (podcast_id) REFERENCES public.podcast(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.podcast
    ADD CONSTRAINT podcast_talent_id_fkey FOREIGN KEY (talent_id) REFERENCES public.talent(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_talent_id_fkey FOREIGN KEY (talent_id) REFERENCES public.talent(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.talent_podcast
    ADD CONSTRAINT talent_podcast_podcast_id_fkey FOREIGN KEY (podcast_id) REFERENCES public.podcast(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.talent_podcast
    ADD CONSTRAINT talent_podcast_talent_id_fkey FOREIGN KEY (talent_id) REFERENCES public.talent(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.talent_shows
    ADD CONSTRAINT talent_shows_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(qp_id) ON DELETE CASCADE;
ALTER TABLE ONLY public.talent_shows
    ADD CONSTRAINT talent_shows_talent_id_fkey FOREIGN KEY (talent_id) REFERENCES public.talent(qp_id) ON DELETE CASCADE;
