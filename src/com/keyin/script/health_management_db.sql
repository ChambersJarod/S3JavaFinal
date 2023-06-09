PGDMP                         {           health_management    15.1    15.1 )    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    17217    health_management    DATABASE     s   CREATE DATABASE health_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
 !   DROP DATABASE health_management;
                postgres    false            �            1259    17247    doctor_patient    TABLE     h   CREATE TABLE public.doctor_patient (
    doctor_id integer NOT NULL,
    patient_id integer NOT NULL
);
 "   DROP TABLE public.doctor_patient;
       public         heap    postgres    false            �            1259    17263    health_data    TABLE     �   CREATE TABLE public.health_data (
    id integer NOT NULL,
    user_id integer NOT NULL,
    weight numeric(5,2) NOT NULL,
    height numeric(5,2) NOT NULL,
    steps integer NOT NULL,
    heart_rate integer NOT NULL,
    date date NOT NULL
);
    DROP TABLE public.health_data;
       public         heap    postgres    false            �            1259    17262    health_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.health_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.health_data_id_seq;
       public          postgres    false    218            4           0    0    health_data_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.health_data_id_seq OWNED BY public.health_data.id;
          public          postgres    false    217            �            1259    17275    medicine_reminders    TABLE     (  CREATE TABLE public.medicine_reminders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    medicine_name character varying(100) NOT NULL,
    dosage character varying(50) NOT NULL,
    schedule character varying(100) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);
 &   DROP TABLE public.medicine_reminders;
       public         heap    postgres    false            �            1259    17274    medicine_reminders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicine_reminders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.medicine_reminders_id_seq;
       public          postgres    false    220            5           0    0    medicine_reminders_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.medicine_reminders_id_seq OWNED BY public.medicine_reminders.id;
          public          postgres    false    219            �            1259    17287    recommendations    TABLE     �   CREATE TABLE public.recommendations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    recommendation_text text NOT NULL,
    date date NOT NULL
);
 #   DROP TABLE public.recommendations;
       public         heap    postgres    false            �            1259    17286    recommendations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.recommendations_id_seq;
       public          postgres    false    222            6           0    0    recommendations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;
          public          postgres    false    221            �            1259    17239    users    TABLE     f  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    is_doctor boolean NOT NULL,
    medical_license_num character varying(50),
    specialization character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17238    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            7           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �           2604    17266    health_data id    DEFAULT     p   ALTER TABLE ONLY public.health_data ALTER COLUMN id SET DEFAULT nextval('public.health_data_id_seq'::regclass);
 =   ALTER TABLE public.health_data ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    17278    medicine_reminders id    DEFAULT     ~   ALTER TABLE ONLY public.medicine_reminders ALTER COLUMN id SET DEFAULT nextval('public.medicine_reminders_id_seq'::regclass);
 D   ALTER TABLE public.medicine_reminders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    17290    recommendations id    DEFAULT     x   ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);
 A   ALTER TABLE public.recommendations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    17242    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            '          0    17247    doctor_patient 
   TABLE DATA           ?   COPY public.doctor_patient (doctor_id, patient_id) FROM stdin;
    public          postgres    false    216   d1       )          0    17263    health_data 
   TABLE DATA           [   COPY public.health_data (id, user_id, weight, height, steps, heart_rate, date) FROM stdin;
    public          postgres    false    218   �1       +          0    17275    medicine_reminders 
   TABLE DATA           p   COPY public.medicine_reminders (id, user_id, medicine_name, dosage, schedule, start_date, end_date) FROM stdin;
    public          postgres    false    220   #2       -          0    17287    recommendations 
   TABLE DATA           Q   COPY public.recommendations (id, user_id, recommendation_text, date) FROM stdin;
    public          postgres    false    222   �2       &          0    17239    users 
   TABLE DATA           {   COPY public.users (id, first_name, last_name, email, password, is_doctor, medical_license_num, specialization) FROM stdin;
    public          postgres    false    215   ]3       8           0    0    health_data_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.health_data_id_seq', 1, false);
          public          postgres    false    217            9           0    0    medicine_reminders_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.medicine_reminders_id_seq', 3, true);
          public          postgres    false    219            :           0    0    recommendations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.recommendations_id_seq', 5, true);
          public          postgres    false    221            ;           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
          public          postgres    false    214            �           2606    17251 "   doctor_patient doctor_patient_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.doctor_patient
    ADD CONSTRAINT doctor_patient_pkey PRIMARY KEY (doctor_id, patient_id);
 L   ALTER TABLE ONLY public.doctor_patient DROP CONSTRAINT doctor_patient_pkey;
       public            postgres    false    216    216            �           2606    17268    health_data health_data_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.health_data
    ADD CONSTRAINT health_data_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.health_data DROP CONSTRAINT health_data_pkey;
       public            postgres    false    218            �           2606    17280 *   medicine_reminders medicine_reminders_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.medicine_reminders
    ADD CONSTRAINT medicine_reminders_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.medicine_reminders DROP CONSTRAINT medicine_reminders_pkey;
       public            postgres    false    220            �           2606    17294 $   recommendations recommendations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_pkey;
       public            postgres    false    222            �           2606    17246    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    17244    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    17252 ,   doctor_patient doctor_patient_doctor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_patient
    ADD CONSTRAINT doctor_patient_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.doctor_patient DROP CONSTRAINT doctor_patient_doctor_id_fkey;
       public          postgres    false    215    216    3465            �           2606    17257 -   doctor_patient doctor_patient_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_patient
    ADD CONSTRAINT doctor_patient_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.users(id);
 W   ALTER TABLE ONLY public.doctor_patient DROP CONSTRAINT doctor_patient_patient_id_fkey;
       public          postgres    false    216    215    3465            �           2606    17269 $   health_data health_data_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.health_data
    ADD CONSTRAINT health_data_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.health_data DROP CONSTRAINT health_data_user_id_fkey;
       public          postgres    false    3465    215    218            �           2606    17281 2   medicine_reminders medicine_reminders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicine_reminders
    ADD CONSTRAINT medicine_reminders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 \   ALTER TABLE ONLY public.medicine_reminders DROP CONSTRAINT medicine_reminders_user_id_fkey;
       public          postgres    false    215    3465    220            �           2606    17295 ,   recommendations recommendations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_user_id_fkey;
       public          postgres    false    3465    215    222            '   #   x�3�4�2�4bS.cN3 m�-�ؒ+F��� Es      )   |   x�U�Q
�0�׻4���˻�9��@�X\D�!	2�*z�i�S�K��]&{Sd!�CY`�e���D�Y�`f!�:�˒�ER�y,��A˶B�S��X� ^�%��ײ��=?Z���5��,(�      +   f   x�3�4��-�)���,I����420�u�Fƺ&�F
�FV�H"��!�!grbAI~AQf�!�VC����%�%gxbQbZ�V$���u��qqq �&�      -   �   x�Ւ1�0E���@�6m;�@b	��DUc�:nO[�X��x����r���L�a�AO9	�	B�$شƞ��Cl��N���֐b�pe�ô����e+:�!�3E4#�Y"�6l@˲�\��(!~#*S���ڢ>j���i7�Q�O�?� [�*��;�U�T�S����_y)��/�*(N      &   h  x�u�ɮ�@�u�w�L2�."�����7�LE)P >}�7���tR��ks�䯚=$E �������YIE�/6�b���/m�[t�s�.C��;M��`n��n��˃.ݐe�Ʌ;�}@)G `" vYr�-���`�OaXeav+�XNX����X��-���z(��m�x���s�^1��(e�5�sҖ�A�����t����+*�QRF�kj4�Pa�����곹�lS��jR� !�6$����+�?��t/6a���5MB�f=��u][Rx�c"��[(������Z+��^� ��0���o�Э��ni���u������!]��@�^��>�tZ\qf+��K��`�T�����u%^m����C�4J�SI&Ǎ�64��Uڻp��}_�ʚ��7����㣣S,���H��b�xH�T?'$�c���㨜3#Jn����?=VwZ��?��,h�,j&�K�p1����6�3ռ��:h��l]Y��8C��=%��n.�zLF?�kl���na�Cj��0�9�jP�.�5kډ�8������L�ZUY<�t>�=���$\6��<=x��8
ڝ{"�8��[No2{����5�L~| �     