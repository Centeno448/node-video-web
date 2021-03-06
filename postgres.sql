PGDMP     7                    x            WebVideo    12.2    12.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16625    WebVideo    DATABASE     �   CREATE DATABASE "WebVideo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "WebVideo";
                WebVideo    false            �            1259    16628    person    TABLE     ]   CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.person;
       public         heap    WebVideo    false            �            1259    16626    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          WebVideo    false    203                       0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          WebVideo    false    202            �            1259    16658    purchase    TABLE     w   CREATE TABLE public.purchase (
    id integer NOT NULL,
    person_id integer NOT NULL,
    amount numeric NOT NULL
);
    DROP TABLE public.purchase;
       public         heap    WebVideo    false            �            1259    16656    purchase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.purchase_id_seq;
       public          WebVideo    false    205                       0    0    purchase_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.purchase_id_seq OWNED BY public.purchase.id;
          public          WebVideo    false    204            �
           2604    16631 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          WebVideo    false    202    203    203            �
           2604    16661    purchase id    DEFAULT     j   ALTER TABLE ONLY public.purchase ALTER COLUMN id SET DEFAULT nextval('public.purchase_id_seq'::regclass);
 :   ALTER TABLE public.purchase ALTER COLUMN id DROP DEFAULT;
       public          WebVideo    false    205    204    205            �
           2606    16636    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            WebVideo    false    203            �
           2606    16666    purchase purchase_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_pkey;
       public            WebVideo    false    205            �
           2606    16667    purchase fk_person_purchase    FK CONSTRAINT     }   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_person_purchase FOREIGN KEY (person_id) REFERENCES public.person(id);
 E   ALTER TABLE ONLY public.purchase DROP CONSTRAINT fk_person_purchase;
       public          WebVideo    false    205    203    2698           