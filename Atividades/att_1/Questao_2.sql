/*

Questão 2 - Crie uma query que retorne o código dos usuários e a faixa etária “Entre 51 a 60 anos”.

Aluno: Danilo Pereira - P3B

*/

select cod_usuario , faixa_etaria 
from public.usuarios where faixa_etaria = 'Entre 51 a 60 anos';
