module temporizador(clock50M, clock);

    input clock50M;
    output clock;
    reg [21:0] contador;

    always@(posedge clock50M) begin
        contador <= contador + 1;
    end

    assign clock = contador [21];

endmodule