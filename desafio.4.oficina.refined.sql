create database if not exists Oficina;
use Oficina;

drop database Oficina;

-- CLIENTE
create table PessoaFisica(
	idPessoaFisica int auto_increment primary key unique,
    CPF char(11) not null,
    Nome varchar(20) not null,
    NomeMeio varchar(20),
    Sobrenome varchar(20) not null,
    DataNascimento date not null,
    Endereço varchar(45) not null,
    TelResidencial int(10),
    Celular int(11) not null
);
alter table PessoaFisica add constraint unique_cpf_PFisica unique (CPF);

alter table PessoaFisica add constraint fk_idClientes_pf foreign key (idPessoaFisica) references Clientes(idClientes),
add constraint fk_clintePf foreign key (idClientePf) references Clientes(idClientes),
add constraint fk_veiculoPf foreign key (idPessoaFisica) references Veiculo(idVeiculo);

desc PessoaFisica;

create table PessoaJuridica(
	idPessoaJuridica int auto_increment primary key unique,
    CNPJ char(14) not null,
    RazaoSocial varchar(45) not null,
    NomeFantasia varchar(45),
    Endereço varchar(45) not null,
    Telefone int(10) not null
);
alter table PessoaJuridica add constraint unique_cpf_PJuridica unique (CNPJ);

alter table PessoaJuridica add constraint fk_clientes_pj foreign key (idPessoaJuridica) references Clientes(idClientes),
add constraint fk_veiculoPj foreign key (idPessoaJuridica) references Veiculo(idVeiculo);

desc PessoaJuridica;

create table Cliente(
	idCliente int auto_increment primary key unique,
    constraint fk_pFisica foreign key (idCliente) references PessoaFisica(idPessoaFisica),
    constraint fk_pJuridica foreign key (idCliente) references PessoaJuridica(idPessoaJuridica)
);
desc Cliente;

-- VEICULO
create table Veiculo(
	idVeiculo int auto_increment primary key,
    Marca enum('VW','GM','Fiat','Pegeout','Renault','Ford','KIA','Chery','Jeep','Outros') not null,
    Modelo varchar(15) not null,
    AnoFabricacao year(4) not null,
    Cor varchar(20) not null,
    Placa char(7) not null,
    constraint idVeiculo_placa unique (idVeiculo, Placa)
);

alter table Veiculo add constraint fk_equip_mecan foreign key (idVeiculo) references EquipMecan(idEquipMecan),
add constraint fk_conserto foreign key (idVeiculo) references Conserto(idConserto),
add constraint fk_revisao foreign key (idVeiculo) references Revisao(idRevisao);

desc Veiculo;

-- CONSERTO
create table Conserto(
	idConserto int auto_increment primary key,
    Descricao varchar(150) not null,
    constraint idConserto_ID unique (idConserto)
);
desc Conserto;

-- REVISÃO
create table Revisao(
	idRevisao int auto_increment primary key,
    Descrição varchar(150) not null,
    constraint idRevisao_ID unique (idRevisao)
);
desc Revisao;

-- MECÂNICOS
create table Mecanicos(
	idMecanicos int auto_increment primary key unique,
    Nome varchar(60) not null,
    Identificacao varchar(25) not null,
    Especialidade varchar(25) not null,
    BoxDeTrabalho varchar(45) not null
);
desc Mecanicos;

-- EQUIPE MECÂNICOS
create table EquipMecan(
	idEquipMecan int auto_increment primary key
);
alter table EquipMecan add constraint fk_Mecanicos foreign key (idEquipMecan) references Mecanicos(idMecanicos);
alter table OrdServ add constraint fk_OrdServ foreign key (idOrdServ) references OrdServ(idOrdServ);

desc EqpMecanicos;

-- ORÇAMENTO
create table Orcamento(
	idOrcamento int auto_increment primary key unique,
    Servicos varchar(150) not null,
	Quantidade int not null,
    ValorServico float not null,
    ValorTotal float not null,
    Aprovado bool not null default false,
    constraint fk_AprCliente foreign key (idCliente) references Cliente(idCliente)
);
alter table Orcamento add constraint fk_OrdServ foreign key (idOrcamento) references OrdServ(idOrdServ);

select * from Orcamento order by Aprovado;

desc Orcamento;

-- ORDEM DE SERVIÇO
create table OrdServ(
	idOrdServ int auto_increment primary key unique,
    Numeracao char(10) not null default('0000000001') unique,
    DataEmissao date not null,
    ValorTotal float not null,
    Status enum('Aguardando', 'Cancelado','Aprovado','Em andamento','Concluido','Entregue'),
    DataConclusao date
);
select * from OrdServ order by DataEmissao;
select * from OrdServ order by ValorTotal;
select * from OrdServ order by Status;
select * from OrdServ order by DataConclusao;

desc OrdServ;

-- ESTOQUE DE PEÇAS
create table Estoque(
	idEstoque int auto_increment primary key,
	Tipo varchar(25) not null,
    Descricao varchar(45) not null,
	Quantidade int not null,
    Local varchar(45) not null
);
desc Estoque;

-- DISPONIBILIDADE DE PEÇAS EM ESTOQUE
create table DispPecas(
	idDispPecas int auto_increment primary key,
    idOrcPecas int,
    idPecasEstoque int,
	constraint fk_OrcPecas foreign key (idOrcPecas) references OrcamentoPecas(idOrcamentoPecas),
	constraint fk_PecasEstoque foreign key (idPecasEstoque) references Estoque(idEstoque)
);
desc Estoque;

-- ORÇAMENTO PEÇAS
create table OrcamentoPecas(
	idOrcamentoPecas int auto_increment primary key,
    Peca varchar(20) not null,
    Descricao varchar(45) not null,
    ValorPeca float not null,
    Quantidade int not null default('1'),
    ValorTotalPeca float not null
);
alter table OrcamentoPecas add constraint fk_OrdServPecas foreign key (idOrcamentoPecas) references OrdServ(idOrdServ);

desc OrcamentoPecas;

-- PAGAMENTO COM CARTÃO DE CRÉDITO
create table Cartao(
	idCartao int auto_increment primary key unique,
    Numero char(16) not null unique,
    Nome varchar(45),
    RazaoSocial varchar(45),
    Validade date not null,
    CVC char(3) not null,
    CPF char(11) unique,
    CNPJ char(14) unique
);
desc Cartao;

-- PAGAMENTO COM DINHEIRO
create table Dinheiro(
	idDinheiro int auto_increment primary key unique,
    Nome varchar(45) not null,
    RazaoSocial varchar(45),
    ValorTotal float not null,
    CPF char(11) unique,
    CNPJ char(14) unique
);
desc Dinheiro;

-- PAGAMENTO COM PIX
create table Pix(
	idPix int auto_increment primary key unique,
    Nome varchar(45) not null,
    RazaoSocial varchar(45),
    ValorTotal float not null,
    CodigoPix char(100) unique
);
desc Pix;

-- PAGAMENTO A VISTA
create table PagVista(
	idPagVista int auto_increment primary key,
    Cartao bool not null default false,
    Pix bool not null default false,
    Dinheiro bool not null default false,
	constraint fk_cartao foreign key (idPagVista) references Cartao(idCartao),
    constraint fk_dinheiro foreign key (idPagVista) references Dinheiro(idDinheiro),
    constraint fk_pix foreign key (idPagVista) references Pix(idPix)
);
desc PagVista;

-- PAGAMENTO PARCELADO
create table PagParcelado(
	idPagParcelado int auto_increment primary key,
    Cartao bool not null default false,
	constraint fk_cartao foreign key (idPagamentoVista) references Cartao(idCartao)
);
desc PagamentoVista;

-- PAGAMENTO
create table Pagamento(
	idPagamento int auto_increment primary key unique,
    ValorVista float not null,
    ValorParcelado float not null,
    Pago tinyint not null default false,
    LiberadoEntrega tinyint not null default false,
    
    constraint fk_PagVista foreign key (idPagamento) references PagVista(idPagVista),
    constraint fk_PagParcelado foreign key (idPagamento) REFERENCES PagParcelado(idPagParcelado),
    constraint fk_Entrega foreign key (idPagamento) references Entrega(idEntrega)
);
desc Pagamento;

-- ENTREGA
create table Entrega(
	idEntrega int auto_increment primary key unique,
    Status enum('Aguardando', 'Cancelado','Aprovado','Em andamento','Concluido','Entregue'),
    LiberadoEntrega tinyint not null default false
);
select * from Entrega order by Status;
select * from Entrega order by LiberadoEntrega;

desc Entrega;