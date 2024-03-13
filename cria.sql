CREATE TABLE dim_categoria (
    sk_categoria    NUMBER NOT NULL,
    nm_categoria    VARCHAR2(90) NOT NULL,
    nm_descricao    VARCHAR2(300) NOT NULL,
    nm_segmentacao  VARCHAR2(80) NOT NULL,
    nm_subcategoria VARCHAR2(80) NOT NULL,
    fl_prioridade   VARCHAR2(5) NOT NULL
);

COMMENT ON COLUMN dim_categoria.sk_categoria IS
    'Esse atributo irá receber a chave Surrogate Key da Dimensão CATEGORIA. O conteúdo será numerico e sequencial. Deve ser preenchido na fase de ETL, seguindo regras pré estabelecidas.'
    ;

COMMENT ON COLUMN dim_categoria.nm_categoria IS
    'Esse atributo irá receber o nome da categoria do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 90 caracteres.'
    ;

COMMENT ON COLUMN dim_categoria.nm_descricao IS
    'Esse atributo irá receber a descricão da categoria do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 300 caracteres.'
    ;

COMMENT ON COLUMN dim_categoria.nm_segmentacao IS
    'Esse atributo irá receber o nome da segmentacão da  categoria do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 80 caracteres.'
    ;

COMMENT ON COLUMN dim_categoria.nm_subcategoria IS
    'Esse atributo irá receber o nome da sub categoria do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até  80 caracteres.'
    ;

COMMENT ON COLUMN dim_categoria.fl_prioridade IS
    'Esse atributo é uma string, e irá categorizar a prioridade da entrega. O conteúdo será obrigatório e irá receber os valores: Alta, Media ou Baixa.'
    ;

ALTER TABLE dim_categoria ADD CONSTRAINT dim_categoria_pk PRIMARY KEY ( sk_categoria );

CREATE TABLE dim_centro_distribuicao (
    sk_centro_distribuicao      NUMBER NOT NULL,
    nm_centro_distribuicao      VARCHAR2(100) NOT NULL,
    sg_estado                   CHAR(2) NOT NULL,
    nm_cidade                   VARCHAR2(60) NOT NULL,
    nm_bairro                   VARCHAR2(45) NOT NULL,
    nm_capacidade_armazenamento NUMBER(5) NOT NULL
);

COMMENT ON COLUMN dim_centro_distribuicao.sk_centro_distribuicao IS
    'Esse atributo irá receber a chave Surrogate Key da Dimensão CENTRO_DISTRIBUICAO. O conteúdo será numerico e sequencial. Deve ser preenchido na fase de ETL, seguindo regras pré estabelecidas.'
    ;

COMMENT ON COLUMN dim_centro_distribuicao.nm_centro_distribuicao IS
    'Esse atributo irá receber o nome do centro de distribuicão cadastrado que irá despachar o produto. Seu conteúdo será obrigatório, podendo assumir até 100 caracteres.'
    ;

COMMENT ON COLUMN dim_centro_distribuicao.sg_estado IS
    'Esse atributo irá receber a sigla do estado do centro de distribuicão que irá despachar o produto. Seu conteúdo será obrigatório, podendo assumir até 2 caracteres.'
    ;

COMMENT ON COLUMN dim_centro_distribuicao.nm_cidade IS
    'Esse atributo irá receber o nome da cidade do centro de distribuicão que irá despachar o produto. Seu conteúdo será obrigatório, podendo assumir até  60 caracteres.'
    ;

COMMENT ON COLUMN dim_centro_distribuicao.nm_bairro IS
    'Esse atributo irá receber o nome do bairro do centro de distribuicão que irá despachar o produto. Seu conteúdo será obrigatório, podendo assumir até 45 caracteres.'
    ;

COMMENT ON COLUMN dim_centro_distribuicao.nm_capacidade_armazenamento IS
    'Esse atributo irá receber o valor numerico da capacidade de armazenamento do centro de distribuicão que irá despachar o produto. Seu conteúdo será obrigatório, podendo assumir até 5  caracteres.'
    ;

ALTER TABLE dim_centro_distribuicao ADD CONSTRAINT dm_centro_distribuicao_pk PRIMARY KEY ( sk_centro_distribuicao );

CREATE TABLE dim_fornecedor (
    sk_fornecedor          NUMBER NOT NULL,
    nm_fornecedor          VARCHAR2(90) NOT NULL,
    sg_estado              CHAR(2) NOT NULL,
    nm_cidade              VARCHAR2(60) NOT NULL,
    nm_bairro              VARCHAR2(45) NOT NULL,
    vl_tempo_medio_entrega NUMBER(2) NOT NULL,
    nm_confiabilidade      NUMBER(2) NOT NULL
);

COMMENT ON COLUMN dim_fornecedor.sk_fornecedor IS
    'Esse atributo irá receber a chave Surrogate Key da Dimensão FORNECEDOR. O conteúdo será numerico e sequencial. Deve ser preenchido na fase de ETL, seguindo regras pré estabelecidas.'
    ;

COMMENT ON COLUMN dim_fornecedor.nm_fornecedor IS
    'Esse atributo irá receber o nome do fornecedor do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 90 caracteres.'
    ;

COMMENT ON COLUMN dim_fornecedor.sg_estado IS
    'Esse atributo irá receber a sigla do estado do fornecedor do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 2 caracteres.'
    ;

COMMENT ON COLUMN dim_fornecedor.nm_cidade IS
    'Esse atributo irá receber a cidade do fornecedor do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 60 caracteres.'
    ;

COMMENT ON COLUMN dim_fornecedor.nm_bairro IS
    'Esse atributo irá receber o bairro do fornecedor do produto cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 45 caracteres.'
    ;

COMMENT ON COLUMN dim_fornecedor.vl_tempo_medio_entrega IS
    'Este atributo é obrigatório, numérico e indica o tempo médio da entrega do produto pelo fornecedor em dias. ';

COMMENT ON COLUMN dim_fornecedor.nm_confiabilidade IS
    'Este atributo receberá o valor de confiabilidade do fornecedor e é obrigatório.. Será um valor numerico e deve estar entre 1 e 10.'
    ;

ALTER TABLE dim_fornecedor ADD CONSTRAINT dim_fornecedor_pk PRIMARY KEY ( sk_fornecedor );

CREATE TABLE dim_produto (
    sk_produto    NUMBER NOT NULL,
    nm_marca      VARCHAR2(90) NOT NULL,
    nm_produto    VARCHAR2(90) NOT NULL,
    nm_cor        VARCHAR2(20) NOT NULL,
    nr_dim_fisica NUMBER(10, 2) NOT NULL,
    nm_sku        VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN dim_produto.sk_produto IS
    'Esse atributo irá receber a chave Surrogate Key da Dimensão PRODUTO. O conteúdo será numerico e sequencial. Deve ser preenchido na fase de ETL, seguindo regras pré estabelecidas.'
    ;

COMMENT ON COLUMN dim_produto.nm_marca IS
    'Esse atributo irá receber a marca  do atributo cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 90 caracteres.'
    ;

COMMENT ON COLUMN dim_produto.nm_produto IS
    'Esse atributo irá receber o nome do atributo cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 90 caracteres.'
    ;

COMMENT ON COLUMN dim_produto.nm_cor IS
    'Esse atributo irá receber a cor  do atributo cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, podendo assumir até 20  caracteres.'
    ;

COMMENT ON COLUMN dim_produto.nr_dim_fisica IS
    'Esse atributo irá receber a dimensão física do  atributo cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, sendo numérico 10 casas decimais e 2 após a vírgula.'
    ;

COMMENT ON COLUMN dim_produto.nm_sku IS
    'Esse atributo irá receber o SKU do  atributo cadastrado e que participou de uma venda no Melhores Compras. Seu conteúdo será obrigatório, sendo uma string de até 30 caracteres.'
    ;

ALTER TABLE dim_produto ADD CONSTRAINT dim_produto_pk PRIMARY KEY ( sk_produto );

CREATE TABLE dim_tempo (
    sk_tempo      NUMBER NOT NULL,
    nr_ano        NUMBER(4) NOT NULL,
    nr_semestre   NUMBER(1) NOT NULL,
    nr_trimestre  NUMBER(1) NOT NULL,
    nr_mes        NUMBER(2) NOT NULL,
    nr_dia        NUMBER(2) NOT NULL,
    nm_dia_semana VARCHAR2(40) NOT NULL,
    hora          DATE NOT NULL,
    fl_feriado    VARCHAR2(3) NOT NULL
);

COMMENT ON COLUMN dim_tempo.sk_tempo IS
    'Esse atributo irá receber a chave Surrogate Key da Dimensão TEMPO. O conteúdo será numerico e sequencial. Deve ser preenchido na fase de ETL, seguindo regras pré estabelecidas.'
    ;

COMMENT ON COLUMN dim_tempo.nr_ano IS
    'Esse atributo irá receber o ano que ocorreu  a venda para o cliente. O conteúdo será obrigatório, numérico e os valores limites devem de 1900 a 4444, de acordo com o calendário usado no Brasil.'
    ;

COMMENT ON COLUMN dim_tempo.nr_semestre IS
    'Esse atributo irá receber o semestre  que ocorreu  a venda para o cliente. O conteúdo será obrigatório, numérico e os valores limites estar entre 1 e 2, de acordo com o calendário usado no Brasil.'
    ;

COMMENT ON COLUMN dim_tempo.nr_trimestre IS
    'Esse atributo irá receber o trimestre  que ocorreu  a venda para o cliente. O conteúdo será obrigatório, numérico e os valores limites estar entre 1 e 4, de acordo com o calendário usado no Brasil.'
    ;

COMMENT ON COLUMN dim_tempo.nr_mes IS
    'Esse atributo irá receber o mês que ocorreu  a venda para o cliente. O conteúdo será obrigatório, numérico e os valores limites devem ser de 1 a 12, de acordo com o calendário usado no Brasil.'
    ;

COMMENT ON COLUMN dim_tempo.nr_dia IS
    'Esse atributo irá receber o dia que ocorreu  a venda para o cliente. O conteúdo será obrigatório, numérico e os valores limites devem ser de 1 a 31, de acordo com o calendário usado no Brasil.'
    ;

COMMENT ON COLUMN dim_tempo.nm_dia_semana IS
    'Esse atributo irá receber o dia da semana por extenso em que ocorreu  a venda para o cliente. O conteúdo será obrigatório e é uma string,de 40 caracteres,  segundo o padrão: segunda-feira, terca-feira, quarta-feira, etc, até domingo. De acordo com o calendário usado no Brasil. '
    ;

COMMENT ON COLUMN dim_tempo.hora IS
    'Esse atributo irá receber a hora exata  em que ocorreu  a venda para o cliente. O conteúdo será obrigatório e é time stamp.';

COMMENT ON COLUMN dim_tempo.fl_feriado IS
    'Esse atributo é uma string, e irá informar se a data é um feriado. O conteúdo será obrigatório e irá receber apenas os valores: Sim ou Não'
    ;

ALTER TABLE dim_tempo ADD CONSTRAINT dim_tempo_pk PRIMARY KEY ( sk_tempo );

CREATE TABLE fto_estoque (
    vl_media_reposicao_categoria NUMBER(8, 2) NOT NULL,
    qt_estoque_minimo            NUMBER(8) NOT NULL,
    vl_taxa_rotatividade         NUMBER(8, 2) NOT NULL,
    vl_estoque_armazenado        NUMBER(8, 2) NOT NULL,
    vl_variacao_estoque_promocao NUMBER(8, 2) NOT NULL,
    sk_fornecedor                NUMBER NOT NULL,
    sk_categoria                 NUMBER NOT NULL,
    sk_produto                   NUMBER NOT NULL,
    sk_centro_distribuicao       NUMBER NOT NULL,
    sk_tempo                     NUMBER NOT NULL
);

COMMENT ON COLUMN fto_estoque.vl_media_reposicao_categoria IS
    'Esta é uma métrica para se obter o tempo médio de reposicão de produto por categoria. É do tipo inteiro, com precisão 8 e escala 2. '
    ;

COMMENT ON COLUMN fto_estoque.qt_estoque_minimo IS
    'Esta é uma métrica que irá receber a quantidade de estoque mínimo de um determinado produto em um período. Seu conteúdo será obrigatório, contendo números inteiros de 8  casas decimais e somente valores positivos serão válidos.'
    ;

COMMENT ON COLUMN fto_estoque.vl_taxa_rotatividade IS
    'Métrica que informa o valor da Taxa de Rotatividade do produto em estoque. Aponta a relacão entre a quantidade vendida e quantidade de estoque. Seu conteúdo será obrigatório, contendo números inteiros de 8 casas e 2 casa após a vírgula e somente valores positivos serão válidos.'
    ;

COMMENT ON COLUMN fto_estoque.vl_estoque_armazenado IS
    'Esta métrica irá receber o valor numérico do estoque de um determinado produto em um período. Seu conteúdo será obrigatório, contendo números inteiros e 10 casas decimais e 2 dígitos após a vírgula. Somente valores positivos serão válidos.'
    ;

COMMENT ON COLUMN fto_estoque.vl_variacao_estoque_promocao IS
    'Essa métrica avalia como o estoque de produtos varia durante os períodos de promoções ou eventos sazonais. Informa a taxa sobre aumento ou diminuição da quantidade de produtos em estoque em relação aos níveis normais. Deve ser um numero inteiro, de até 8 casas decimais e duas casas após a vírgula e seu conteúdo é obrigatório.'
    ;

ALTER TABLE fto_estoque
    ADD CONSTRAINT fto_estoque_pk PRIMARY KEY ( sk_fornecedor,
                                                sk_categoria,
                                                sk_produto,
                                                sk_centro_distribuicao,
                                                sk_tempo );

ALTER TABLE fto_estoque
    ADD CONSTRAINT fk_dim_categoria_fto_estoque FOREIGN KEY ( sk_categoria )
        REFERENCES dim_categoria ( sk_categoria );

ALTER TABLE fto_estoque
    ADD CONSTRAINT fk_dim_centro_dist_fto_estoque FOREIGN KEY ( sk_centro_distribuicao )
        REFERENCES dim_centro_distribuicao ( sk_centro_distribuicao );

ALTER TABLE fto_estoque
    ADD CONSTRAINT fk_dim_fornecedor_fto_estoque FOREIGN KEY ( sk_fornecedor )
        REFERENCES dim_fornecedor ( sk_fornecedor );

ALTER TABLE fto_estoque
    ADD CONSTRAINT fk_dim_produto_fto_estoque FOREIGN KEY ( sk_produto )
        REFERENCES dim_produto ( sk_produto );

ALTER TABLE fto_estoque
    ADD CONSTRAINT fk_dim_tempo_fto_estoque FOREIGN KEY ( sk_tempo )
        REFERENCES dim_tempo ( sk_tempo );
