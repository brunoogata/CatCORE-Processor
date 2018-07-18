# CatCORE-Processor
CatCORE is a monocycle MIPS-based architecture written in Verilog for Computational Systems Lab: Computer Architecture and Organization discipline.

## Proposta
O processador CatCore foi baseado na arquitetura MIPS monociclo em que
cada instrução só pode ser executada em um ciclo de clock. Sua unidade
de processamento contém um Banco de Registradores,
para armazenar os dados a processar, uma Unidade Lógica Aritmética, para
realizar as operações lógico-aritméticas, quatro multiplexadores,
para controle, além de um Program Counter, para definir o endereço
da instrução a ser executada. A Memória Principal é composta de uma
Memória de Instruções, que armazena as instruções a serem executadas, e
uma Memória Principal, para armazenar informações que não estão presentes
no Banco de Registradores. Para controlar as operações executadas nos módulos, foi implementada uma Unidade de Controle e
como interface para interação com o usuário, foi desenvolvido um módulo de
Entrada-Saída.

## Conjunto de Instruções
Conjunto de Instruções formado por 25 instruções envolvendo operações lógico-aritméticas, deslocamento de memória e pulos de endereços.

### Instruções
![alt text](https://github.com/brunoogata/CatCORE-Processor/blob/master/Files/Instructions_OPCODE%20-%20CatCore.png "Instrucoes e Opcodes")
 
### Mapeamento das Instruções
![alt text](https://github.com/brunoogata/CatCORE-Processor/blob/master/Files/Instructions%20Map%20-%20CatCore.png "Mapeamento das Instrucoes")

## Arquitetura Base
![alt text](https://github.com/brunoogata/CatCORE-Processor/blob/master/Files/Architecture%20-%20CatCore.png "CatCore 2.0")
