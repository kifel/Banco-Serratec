programa
{
	inclua biblioteca Util --> ul
	//Iniciando a variavel global, do usuario, contendo login, senha e saldo
	cadeia users[10][3] = 
	{
		{"Admim", "Admin", "1000"},
		{"","",""}, 
		{"","",""}, 
		{"","",""},
		{"","",""},
		{"","",""},
		{"","",""},
		{"","",""},
		{"","",""},
		{"","",""}
	}

	funcao inicio() //função que da inicio no programa
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
		escreva("\n*           1.Cadastro        *")
		escreva("\n*           3.Sair            *\n")
		linhaMenu() //chama função de imprimir linha do menu
		escreva("\n=> ")
		leia(opcao)

		escolha(opcao) {
			caso 1: // Login
				//login()
			pare
			caso 2: // Cadastro
				cadastro() // chama função de cadastrar usuario
			pare
			caso 3: // Sair do programa
				limpa() // limpa a tela
				escreva("Agradecemos por utilizar o Banco Serratec, Até mais !")
				ul.aguarde(2000) // aguarda 2s antes de finalizar o programa
			pare
			caso contrario: // se opção for invalida ele chama a função menu novamente
				limpa() //limpa tela
				escreva("\nOpção Invalida, tente novamente\n")
				menu() //chama função menu
			pare
		}
	}

	funcao vazio cadastro() { //função que realiza o cadastro na matriz

		//declarando variaveis
		cadeia user, senha
		inteiro controle = 0 //variavel auxiliar para preencher apenas um lugar por vez no cadastro
			
		limpa() //limpa tela

		para(inteiro i = 0; i < ul.numero_linhas(users); i++) { //laço de repedição que passa por todas as linhas
			para(inteiro j = 0; j < 2; j++) { //laço de repedição que passa por todas as colunas
				se (controle == 0) { //Verifica se ainda não foi feito o cadastro
					
					se (users[i][j] == "") { //Verifica os locais ainda nao tem cadastrado usuario na matriz
					escreva("Digite o seu usuario :")
					leia(user)
					users[i][0] = user //Armazena na matriz o usuario na linha i coluna 0
					escreva("Digite o sua senha :")
					leia(senha)
					users[i][1] = senha //Armazena na matriz o usuario na linha i coluna 1
					limpa()
					escreva("Cadastro efetuado com sucesso, porfavor faça o login\n")
					controle++ //Variavel de controle para so fazer um cadastro por vez			
					}
				}
			}
		}

		menu() //Apos o cadastro volta para o menu	
	}

	funcao vazio login() {
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2947; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {users, 5, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */