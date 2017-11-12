=begin

Agile Tester : Thiago Alan de Jesus Silva
Squad: Pacotes e serviços

Progama feito para comparação do valor do Dolar  
 
=end

Dado(/^que acessei a página do buscador$/) do
  visit 'https://www.bing.com/'
end

Dado(/^insiro no campo de busca palavra UOL$/) do
	fill_in('sb_form_q', :with =>'UOL')
end

Quando(/^clico no botão pesquisa$/) do
    find(:id, 'sb_form_go').click
end

Quando(/^clico no primeiro resultado$/) do
    sleep 15
    find(:css, 'html body div#b_content ol#b_results li.b_algo h2.b_topTitle a').click
end

Quando(/^clico no link economia$/) do
  find(:link, 'Economia').click	
end

Então(/^comparo se o valor do dólar é menor que R\$ (\d+)\.(\d+)$/) do |arg1, arg2|
  #Cotação dolar comercial
  dolar = find(:xpath, '/html/body/section/div[1]/section/div[1]/div/section/section/div[2]/ul/li[1]/p[2]').text
  
  #Se for menor, o teste deverá encerrar com sucesso
  #realizando comparação convertendo o valor para float  
  # '[9,15]' significa a variável 'dolar' não considera o que vem antes do valor numérico ou seja caracteres como +0.49 R$ não são considerados
  
	if dolar[9,15].sub(/,/, ".").to_f < 3.20
		#Aqui encerra o teste com sucesso apresentando o valor dolar sendo menor que R$3,20
		puts "Sucesso: #{dolar}"

		else
			#Se for maior o teste deverá quebrar.
			#Aqui o teste deve quebrar caso o dolar seja maior que R$3,20 então usamos o 'fail'
		puts "Insucesso :( - R$#{dolar[9,15]}"
		fail
		 
	end
end