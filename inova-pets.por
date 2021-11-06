programa
{
	//O *petshop* INOVA PETS, é uma empresa que trabalha no prédio da RFFSA em São Luís
	//oferecendo produtos de alta qualidade para cães e gatos, priorizando sempre o 
	//bem-estar e a segurança dos animais, garantindo comodidade, benefícios e qualidade de
	//atendimento aos clientes. O atendimento é composto por um responsável contratado
 	//que cuida do caixa e 3 atendentes, que recebem comissão por produto vendido, 
 	//paga pela empresa e obedece à tabela abaixo:

 	//Criar um algoritmo que seja capaz de mostrar o total e a comissão do atendente 
 	//ao final da venda.
	
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Matematica --> mat

	cadeia produtos[20]
	inteiro codigoVendedor
	real total = 0.00
	real comissao = 0.00
	inteiro opcao
	
	//Funções estéticas	
	funcao mostrarTelaInicial(){
		escreva("       /\\_/\\  \n")
		escreva("      ( ^.^ ) _)\n")
		escreva("       \\ ¨¨/ (\n")
		escreva("   =  ( | | )  =\n")
		escreva("  == (__d b__) ==\n")
		escreva("===  INOVA PETS  ===")
	}
	
	funcao exibirLogo(){
		escreva("============================","\n")
		escreva("======== INOVA PETS ========","\n")
		escreva("============================","\n\n")	
	}
	
	funcao linhaTracejada(){
		escreva("============================","\n")
	}

	funcao vendaFinalizada(){
		escreva("============================","\n")
		escreva("      VENDA FINALIZADA   ","\n")
		escreva("============================","\n")	
	}
	
	//Função para pausar a tela enquanto o enter não for pressionado
	funcao espere(){
		cadeia _
		escreva("\n\nPressione enter para continuar...")
		leia(_)
	}
	
	//funções de acesso e exibição dos produtos do arquivo do bloco de notas
	funcao acessarProdutos(){
		const cadeia CAMINHO = "./produtos.txt"
		se(arq.arquivo_existe(CAMINHO)){
			inteiro arquivo = arq.abrir_arquivo(CAMINHO, arq.MODO_LEITURA)
			cadeia linha
			para(inteiro i = 0; i < 20; i++){
				linha = arq.ler_linha(arquivo)
				se(linha==""){
					pare
				}senao{
					produtos[i] = linha
				}
			}
			arq.fechar_arquivo(arquivo)
		}
	}	
	
	funcao exibirProduto(inteiro quantidade, inteiro codigoProduto){
		exibirLogo()
		escreva(quantidade,"X ",produtos[codigoProduto-1],"\n")
	}

	//Função para mostrar opções do menu
	funcao exibirMenu(){
		exibirLogo()
		escreva("(1) Abrir Caixa\t (2) Encerrar\n\n")
		leia(opcao)
		limpa()
	}

	//Funções para realizar venda
	funcao abrirCaixa(){
		
		exibirLogo()
		escreva("-       CAIXA ABERTO       -","\n\n")
		escreva("Digite o código do Vendedor:\n\n (1) Vendedor 1\t (3) Vendedor 3\n (2) Vendedor 2\t (4) Pular\n")
		leia(codigoVendedor)
		
		enquanto (codigoVendedor < 1 ou codigoVendedor > 4){ 
			limpa()
			escreva("Digite um código válido.")
			espere()
			limpa()
			exibirLogo()
			escreva("-       CAIXA ABERTO       -\n\n")
			escreva("Digite o código do Vendedor:\n\n (1) Vendedor 1\t (3) Vendedor 3\n (2) Vendedor 2\t (4) Pular\n")
			leia(codigoVendedor)
		} 
			
		limpa()
	}

	funcao iniciarVenda(){
		
		inteiro codigoProduto
		logico continuar = verdadeiro
		inteiro quantidade = 0
		real precos[] = {21.50,120.00,9.90,14.90,29.9,14.00,4.90,55.90,16.10,21.90,34.80,99.00,14.90,54.90,29.90,19.90,26.90,34.90,69.90,49.90}
		
		
		enquanto (continuar){
			exibirLogo()
			escreva("Digite o código do produto ou digite 0 para finalizar: \n")
			leia(codigoProduto)
			limpa()
			se (codigoProduto >= 1 e codigoProduto <= 20){ 
				exibirLogo()
				escreva("Digite quantidade: \n\n")
				leia(quantidade)
				limpa()
				exibirProduto(quantidade, codigoProduto)
				espere()
				limpa()
				real preco = precos[codigoProduto - 1]
				real valorDevido = preco * quantidade
				total += valorDevido
				se (preco < 19.90){
					comissao += valorDevido * 0.10
				} senao {
					comissao += valorDevido * 0.15
				}
			} senao se (codigoProduto == 0){
				pare
			} senao {
				exibirLogo()
				escreva("Produto não registrado.")
				espere()
				limpa()
			}
		}
	}
		
	
	funcao finalizarVenda(){
		exibirLogo()
		escreva("Total Devido: R$ ",mat.arredondar(total,2),"\n\n")
		se(codigoVendedor != 4){
			escreva("Vendedor: ",codigoVendedor,"\n")
			escreva("Comissão: R$ ",mat.arredondar(comissao,2),"\n\n")
			
		} 
		vendaFinalizada()
	}
	
	funcao inicio()
	{
		mostrarTelaInicial()
		espere()
		limpa()
		acessarProdutos()
		exibirMenu()

		//Quando o usuário não digitar número válido (1 ou 2), exibir mensagem de instrução
		enquanto(opcao < 1 ou opcao > 2){
			limpa()
			escreva("Digite uma opçao válida.")
			espere()
			limpa()
			exibirMenu()
		}

		//Opções do menu
		escolha(opcao){
			caso 1:
			abrirCaixa()
			iniciarVenda()
			finalizarVenda()
			espere()
			limpa()
			inicio()
			pare
			caso 2:
			limpa()
			pare
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4638; 
 * @DOBRAMENTO-CODIGO = [48, 55, 78, 93];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */