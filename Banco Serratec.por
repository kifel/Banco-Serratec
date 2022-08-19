programa
{
	inclua biblioteca Util --> ul
	inclua biblioteca Texto --> txt
	//Iniciando a variavel global, do usuario, contendo login, senha e saldo
	real saldo[10] = {1000.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	inteiro id, controleHistorico = 0, quantCadastro = 1
	cadeia historico[10]
	cadeia users[10][2] = 
	{
		{"Admim", "Admin"},
		{"",""}, 
		{"",""}, 
		{"",""},
		{"",""},
		{"",""},
		{"",""},
		{"",""},
		{"",""},
		{"",""}
	}

	funcao inicio() //função que da inicio no programa
	{
		linhaMenu() //chama funçao de imprimir linha
		escreva("\n* Bem vindo ao BANCO SERRATEC *\n")
		linhaMenu() //chama funçao de imprimir linha
		ul.aguarde(2000) //aguarda 2s antes de fazer o proximo passo
		limpa() //limpa a tela
		menu() //chama o menu do programa
		
	}

	funcao vazio linhaMenu() {  //Função que imprime linha do menu
		
		const inteiro linha = 31 //constante de controle, define quantas * vai ser mostrado na tela

		para(inteiro i = 0; i < linha; i++) { //laço de repetição para imprimir a linha do menu
			escreva("*")
		}
	}

	funcao vazio menu() { //função do menu
		
		inteiro opcao //variael que vai definir a escolha do usuario
		
		linhaMenu() //chama função de imprimir linha do menu
		escreva("\n*           1.Login           *")
		escreva("\n*           2.Cadastro        *")
		escreva("\n*           3.Sair            *\n")
		linhaMenu() //chama função de imprimir linha do menu
		escreva("\n=> ")
		leia(opcao)

		escolha(opcao) {
			caso 1: // Login
				login()
			pare
			caso 2: // Cadastro
				se(quantCadastro < 10) {
					cadastro() // chama função de cadastrar usuario
				}senao {
					escreva("Número maximo de usuarios cadastrados")
					ul.aguarde(2000)
					limpa()
					menu()
				}	
			pare
			caso 3: // Sair do programa
				limpa() // limpa a tela
				escreva("Agradecemos por utilizar o Banco Serratec, Até mais !")
				ul.aguarde(2000) // aguarda 2s antes de finalizar o programa
			pare
			caso contrario: // se opção for invalida ele chama a função menu novamente
				limpa() //limpa tela
				escreva("\nOpção Inválida, tente novamente\n")
				menu() //chama função menu
			pare
		}
	}

	funcao vazio cadastro() { //função que realiza o cadastro na matriz

		//declarando variaveis
		cadeia user, senha
		inteiro controle = 0 //variavel auxiliar para preencher apenas um lugar por vez no cadastro
		logico cad = falso	
		
		limpa() //limpa tela

		escreva("Digite o seu usuario: ")
		leia(user)

		para(inteiro i = 0; i < ul.numero_linhas(users); i++) { //laço de repedição que passa por todas as linhas
			para(inteiro j = 0; j < ul.numero_colunas(users); j++) { //laço de repedição que passa por todas as colunas
				se(users[i][0] == user) {
					se(cad == falso) {
						escreva("Erro, usuario já cadastrado, tente novamente\n\n")
						controle++
						ul.aguarde(3000)
						limpa()
						cad = verdadeiro
					}
				}senao {
					se (controle == 0) { //Verifica se ainda não foi feito o cadastro
						
						se (users[i][j] == "") { //Verifica os locais ainda nao tem cadastrado usuario na matriz
							users[i][0] = user //Armazena na matriz o usuario na linha i coluna 0
							escreva("Digite o sua senha: ")
							leia(senha)
							users[i][1] = senha //Armazena na matriz o usuario na linha i coluna 1
							limpa()
							escreva("Cadastro efetuado com sucesso, por favor faça o login\n")
							ul.aguarde(3000)
							limpa()
							controle++ //Variavel de controle para so fazer um cadastro por vez
							quantCadastro++
							cad = verdadeiro		
						}
					}
				}
			}
		}

		menu() //Apos o cadastro volta para o menu	
	}

	funcao vazio login() { //Validaçao de login do usuario

		//Declaração de variavel
		cadeia user, senha
		inteiro controle = 0 //Variavel de controle para saber se o usuario foi encontrado
		limpa() //Limpa tela
		escreva("Digite seu login: ")
		leia(user)
		escreva("Digite sua senha: ")
		leia(senha)

		limpa() //Limpa tela

		para(inteiro i = 0; i < ul.numero_linhas(users); i++) { //laço de repedição que passa por todas as linhas
			para(inteiro j = 0; j < ul.numero_colunas(users); j++) { //laço de repedição que passa por todas as colunas
				se(controle == 0) { //Verifica o ja foi encontrado o usuario						
					se(user == users[i][j] e senha == users[i][1] e user != "" e senha != "") { //verifica o login e senha passados
						escreva("Logado com sucesso!!!!")
						id = i //Id do usuario para utilizar o vetor de saldo
						controle++ //Variavel de auxiliar de login
						ul.aguarde(2000)
						limpa() //limpa tela
						menuLogado() //Chama função do Menu para usuario logado
					}
				}
			}
		}
		se (controle == 0) { // se o login nao foi efetuado mostrar a mensagem de erro
			limpa() //limpa a tela
			escreva("Usuario ou senha errado, tente novamente\n")
			ul.aguarde(3000)
			limpa() //limpa a tela
			menu() //Chama o login novamente
		}
	}

	funcao vazio menuLogado() { // Menu de opçoes para 

		cadeia confirmacao
		inteiro opcao
		real deposito, saque
		
		linhaMenu()
		escreva("\n*           1-Saque           *")
		escreva("\n*           2-Saldo           *")
		escreva("\n*           3-Deposito        *")
		escreva("\n*           4-Historico       *")
		escreva("\n*           5-Sair            *\n")
		linhaMenu()
		escreva("\n=> ")
		leia(opcao)

		escolha(opcao) {
			caso 1:
			
				limpa()
				escreva("Digite o valor que deseja sacar: ")
				escreva("\n=> R$")
				leia(saque)
				escreva("\n\nDeseja confirmar a operação: (S/N)")
				escreva("\n=> ")
				leia(confirmacao)
				confirmacao = txt.caixa_alta(confirmacao)

				se(confirmacao == "S") {
					se(saque <= 0) {
                              ul.aguarde(2000)
                         	limpa()
                         	escreva("valor de saque inválido")
                         	escreva("\nSaldo da conta: R$ ", saldo[id])
                            	ul.aguarde(2000)
                            	limpa()
                            	menuLogado()
                         }senao se(saque > saldo[id]) {
						escreva("\nValor na conta não disponivel")
						escreva("\nSaldo da conta: R$ ", saldo[id])
						ul.aguarde(2000)
						limpa()
						menuLogado()
					}senao {
						escreva("\nSaque efetuado com sucesso\n")
						saldo[id] = saldo[id] - saque
						historico[controleHistorico] = ("Saque de R$ "+ saque)
						controleHistorico++
						ul.aguarde(2000)
						limpa()
						menuLogado()
					}
				}senao se (confirmacao == "N") {
					escreva("\n\nVoltando....")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}senao {
					escreva("\n\nErro, opção invalida\n\n")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}
				
			pare
			caso 2:
				limpa()
				escreva("\n\nDeseja confirmar a operação: (S/N)")
				escreva("\n=> ")
				leia(confirmacao)
				confirmacao = txt.caixa_alta(confirmacao)
				se(confirmacao == "S") {
					escreva("Saldo da conta: R$", saldo[id])
					ul.aguarde(3000)
					limpa()
					menuLogado()
				}senao se (confirmacao == "N") {
					escreva("\n\nVoltando....")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}senao {
					escreva("\n\nErro, opção invalida\n\n")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}
			pare
			caso 3:
				limpa()
				escreva("Digite o valor que deseja depositar na conta\n")
				escreva("\n=> R$")
				leia(deposito)
				escreva("\n\nDeseja confirmar a operação: (S/N)")
				escreva("\n=> ")
				leia(confirmacao)
				confirmacao = txt.caixa_alta(confirmacao)

				se(confirmacao == "S") {
                         se(deposito <= 0) {
                         	ul.aguarde(2000)
                         	limpa()
                         	escreva("valor de depósito inválido")
                         	ul.aguarde(2000)
                         	limpa()
                         	menuLogado()
                         }senao{
					saldo[id] = deposito + saldo[id]
                         }
					historico[controleHistorico] = ("Deposito de R$ "+ deposito)
					controleHistorico++
					ul.aguarde(3000)
					limpa()
					menuLogado()
				}senao se (confirmacao == "N") {
					escreva("\n\nVoltando....")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}senao {
					escreva("\n\nErro, opção invalida\n\n")
					ul.aguarde(2000)
					limpa()
					menuLogado()
				}
				
			pare
			caso 4:
				limpa()
				escreva("Histórico: \n")
				se(controleHistorico == 0) {
					escreva("ainda nao foi feito movimentações")
				}senao {
					para(inteiro i = 0; i < controleHistorico; i++) {
						escreva(historico[i], "\n")	
					}	
				}
				ul.aguarde(3000)
				limpa()
				menuLogado()
				
			pare
			caso 5:
				limpa()
				escreva("Saindo da conta\n")
				ul.aguarde(2000)
				limpa()
				controleHistorico = 0
				menu()
			pare
			caso contrario:
				limpa()
				escreva("Opção inválida, tente novamente \n")
				ul.aguarde(2000)
				menuLogado()
			pare
		}		
	}
}
