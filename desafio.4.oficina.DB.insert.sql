use Oficina;

select * from PessoaFisica;
insert into PessoaFisica values (1, 52735862560, 'Mick', null, 'Dolphin', '1995/05/20', 'Rua Pamonha, 243, Jardim Maneiro, Jundiaí-SP', '1159874569', '11966551122'),
								(2, 12563565985, 'Nick', 'Mills', 'Atom', '1975/03/30', 'Rua Tapinha, 245, Jardim Amélia, Mizambinho-SP', '1555628312', '1168885555'),
                                (3, 68752399785, 'Paula', 'Carla', 'Dafny', '2001/08/04', 'Rua Chimbica, 1005, Covinha, Taguaí-SP', '1348638971', '11969985222'),
                                (4, 23542156325, 'Ana', null, 'Cuesta', '1970/08/05', 'Rua Chamboca, 101, Florida, Areias-SP', '1759857892', '11947859632'),
                                (5, 88889652322, 'Marco', 'Pierre', 'White', '2000/11/12', 'Rua Pampulha, 003, Filipinus, Pedregulho-SP', '1757895689', '11952147856'),
                                (6, 25687542155, 'Rock', null, 'Balboa', '1994/03/02', 'Rua Palhuca, 102, Jambó, Palhoça-SP', '1167895222', '11969874523');

select * from PessoaJuridica;
insert into PessoaJuridica values (7, 52735862560001, 'João Pedro ME', 'Cristal Automóveis', 'Rua Matanga, 2024, Jardim Matuto, Matuca-SP', '1155689987'),
								  (8, 55682333880006, 'Mauricio Macuba Ltda', 'Concessionária Macuba', 'Rua Trujilo, 2024, Jardim Alvarenga, Macurino-RJ', '2145869823');

select * from Veiculo;
insert into Veiculo values 	(1, 'VW', 'Fox', '2019', 'Prata', 'BGR4554'),
							(2, 'Ford', 'Focus', '2019', 'Preto', 'WDT5678'),
                            (3, 'GM', 'Cruze', '2021', 'Vermelho', 'BTG3344'),
                            (4, 'KIA', 'Picanto', '2008', 'Amarelo', 'TGH3245'),
                            (5, 'Chery', 'QQ', '2008', 'Prata', 'ITI5677'),
                            (6, 'Fiat', 'Estrada', '2010', 'Azul Ilheus', 'ZCX9876'),
							(7, 'Pegeout', '208', '2020', 'Areia', 'TYU6777'),
                            (8, 'Fiat', 'Doblo', '2021', 'Branca', 'TTR2356');

select * from Conserto;
insert into Conserto values (1, 'Não funciona'),
							(2, 'Não liga'),
                            (3, 'Volante puxa para lado direito'),
                            (4, 'Barulho no assoalho'),
                            (5, 'Roda dianteira direita parece estar desalinhada ou torta, carro tripida'),
                            (6, 'Ar condicionado não funciona'),
							(7, 'Motor liga mas morre em seguida'),
                            (8, 'Barulho na suspensão');
                            
select * from Mecanicos;
insert into Mecanicos values	(1, 'Marcola', 'GEO234', 'Mecânico Geral', 'Box 24'),
								(2, 'Marcio Japão', 'GEO108', 'Mecânico Geral', 'Box 20'),
								(3, 'João Claudio', 'GEO054', 'Alinhamento', 'Box 03'),
								(4, 'Pedro Paulo', 'GEO005', 'Restauração/Funelaria', 'Box 07'),
								(5, 'Felipe Bocão', 'GEO008', 'Borracharia e Rodas', 'Box 17'),
								(6, 'Jean Pierre', 'GEO002', 'Ar condicionado', 'Box 001'),
								(7, 'Marcos Padilha', 'GEO005', 'Motor e Ignição', 'Box 010'),
								(8, 'Marcinho', 'GEO013', 'Suspensão em Geral', 'Box 011');
                                
select * from Estoque;
insert into Estoque values 	(1, 'Bateria', 'Bateria 12v para WV 4 cilindros', '1', 'Estoque local'),
							(2, 'Ignição', 'Ignição para Ford Focus', '1', 'Estoque local'),
							(3, 'Pastilha de freio', 'Pastilhas de freio para GM, Ford, WV e Fiat', '10', 'Estoque local'),
							(4, 'Compressor de ar condicionado', 'Compressor ar condicionado para veículos 4 cilindros da marca Fiat', '1', 'Jofram Compressores'),
							(5, 'Amortecedores', 'Par de amortecedores para linha Fiat até 1.2 toneladas', '2', 'Stone Amortecedores'),
							(6, 'Caixa de câmbio', 'Caixa de câmbio para Pegeout 2008', '1', 'Estoque local'),
							(7, 'Rodas de Liga Leve', 'Modelos variados a escolher', '4', 'Rodão Automotiva'),
							(8, 'Barra de direção', 'Barra de direção para KIA, Chery e Importados', '1', 'Importados Co.');

select * from Orcamento;
insert into Orcamento values 	(1, 'Revisão de motor, bateria, ignição e demais itens correlacionados.', '1', '150.00', '150.00', true),
								(2, 'Revisão de motor, bateria, ignição e demais itens correlacionados.', '1', '150.00', '150.00', true),
								(3, 'Revisão de alinhamento dianteiro do veículo', '1', '80.00', '80.00', true),
								(4, 'Inspeção de pontos de ferrugem, partes da lataria solta, verificação de integridade de assoalho.', '1', '100.00', '100.00', true),
								(5, 'Revisão de alinhamento dianteiro do veículo e verificação de rodas danificadas', '1', '120.00', '120.00', true),
								(6, 'Revisão da integridada de compressor de ar condicionado, caso danificado troca de compressor.', '2', '400.00', '400.00', true),
								(7, 'Verificação de marcha lenta do motor e qualidade das velas de ignição', '1', '200.00', '200.00', true),
								(8, 'Troca de conjunto de amortecedores danificados.', '4', '250.00', '1000.00', true);
                                
select * from OrcamentoPecas;
insert into OrcamentoPecas values 	(1, 'Bateria', 'Bateria 12v para WV 4 cilindros', '350.00', '1', '350.00'),
									(2, 'Ignição', 'Ignição para Ford Focus', '250.00', '1', '250.00'),
									(3, 'Pastilha de freio', 'Pastilhas de freio para GM, Ford, WV e Fiat', '40.00', '10', '400.00'),
									(4, 'Compressor de ar condicionado', 'Compressor ar condicionado para veículos 4 cilindros da marca Fiat', '1550.00', '1', '1550.00'),
									(5, 'Amortecedores', 'Par de amortecedores para linha Fiat até 1.2 toneladas', '370.00', '2', '740.00'),
									(6, 'Caixa de câmbio', 'Caixa de câmbio para Pegeout 2008', '2800.00', '1', '2800.00'),
									(7, 'Rodas de Liga Leve', 'Modelos variados a escolher', '450.00', '4', '1800.00'),
									(8, 'Barra de direção', 'Barra de direção para KIA, Chery e Importados', '670.00', '1', '670.00');

select * from OrdServ;
insert into OrdServ values 	(1, '2022001201', '2022/09/08', '150.00', 'Concluido', '2022/09/22'),
							(2, '2022001202', '2022/09/08', '150.00', 'Concluido', '2022/09/25'),
							(3, '2022001203', '2022/09/09', '80.00', 'Em andamento', null),
							(4, '2022001204', '2022/09/11', '100.00', 'Em andamento', null),
							(5, '2022001205', '2022/09/22', '120.00', 'Aprovado', null),
							(6, '2022001206', '2022/09/22', '1550.00', 'Aprovado', null),
							(7, '2022001207', '2022/09/25', '200.00', 'Aprovado', null),
							(8, '2022001208', '2022/09/25', '1000.00', 'Aprovado', null);
  
select * from Pix;
insert into Pix values 	(1, 'Mick Dolphin', null, '500.00', 'flohjs97390lsjsllajmoow99029083ksjsmzlznjkishu39786578'),
						(2, 'Nick Mils Atom', null, '400.00', 'xjvohrmjdddsllajmoow99029083ksjsmzlhlovjhskvmurhs08975938373');

select * from PagVista;
insert into PagVista values 	(1, 'false', 'true', 'false'),
								(2, 'false', 'true', 'false');

select * from Pagamento;
insert into Pagamento values 	(1, '500.00', '550.00', 'true', 'true'),
								(2, '400.00', '440.00', 'true', 'true');
                                
select * from Entrega;
insert into Entrega values 	(1, 'Entregue', 'true'),
							(2, 'Concluido', 'true');