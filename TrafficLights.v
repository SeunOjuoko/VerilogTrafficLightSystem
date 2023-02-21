module TrafficLights (
    input clk, reset,
    //input [2:0] selection;
    output [2:0] road_lights1,
    output [2:0] road_lights2,
    output [2:0] train_lights1,
    output [2:0] train_lights2,
    output [1:0] crossing_signals
	);
	
    parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5;
    reg[3:0] counter;
    reg[2:0] selection;
    parameter d_signal = 5, amber_delay = 0.125, train_delay = 0.25;
    
    always@(posedge clk or posedge reset or posedge selection)
    begin
        if (reset == 1)
        begin
            selection <= state0;
            counter <= 0;
        end
    
        //if (case(selection))
        case(selection)
            state0: if(counter<d_signal)
                        begin
                        selection <= state0;
                        counter = counter + 1;
                        end
                    else
                        begin
                        selection <= state1;
                        counter <= 0;
                    end
            state1: if(counter<amber_delay)
                        begin;
                            selection <= state1;
                            counter = counter + 1;
                        end
                    else
                        begin
                            selection <= state2;
                            counter <= 0;
                        end
            state2: if(counter<amber_delay)
                        begin;
                        selection <= state2;
                        counter = counter + 1;
                        end
                    else
                        begin
                            selection <= state3;
                            counter <= 0;
                        end
            state3: if(counter<train_delay)
                        begin;
                            selection <= state3;
                            counter = counter + 1;
                        end
                    else
                        begin
                            selection <= state4;
                            counter <= 0;
                        end
            state4: if(counter<amber_delay)
                        begin;
                            selection <= state4;
                            counter = counter + 1;
                        end
                    else
                        begin
                            selection <= state5;
                            counter <= 0;
                        end
            state5: if(counter<amber_delay)
                        begin;
                            selection <= state5;
                            counter = counter + 1;
                        end
                    else
                        begin
                            selection <= state0;
                            counter <= 0;
                        end
                    default: selection <= state0;
                //end
        endcase
        
            //always@ (selection)
            begin
        
                case(selection)
            
                    state0:
                    begin
                        road_lights1 <= 3'b001;
                        road_lights2 <= 3'b001;
                        train_lights1 <= 3'b100;
                        train_lights1 <= 3'b100;
                        crossing_signals <= 2'b11;
                    end
                
                    state1:
                    begin
                        road_lights1 <= 3'b010;
                        road_lights2 <= 3'b010;
                        train_lights1 <= 3'b100;
                        train_lights1 <= 3'b100;
                        crossing_signals <= 2'b00;
                    end
                
                    state2:
                    begin
                        road_lights1 <= 3'b100;
                        road_lights2 <= 3'b100;
                        train_lights1 <= 3'b110;
                        train_lights1 <= 3'b110;
                        crossing_signal <= 2'b00;
                    end
                    
                    state3:
                    begin
                        road_lights1 <= 3'b100;
                        road_lights2 <= 3'b100;
                        train_lights1 <= 3'b001;
                        train_lights1 <= 3'b001;
                        crossing_signal <= 2'b00;
                    end
                    
                    state4:
                    begin
                        road_lights1 <= 3'b100;
                        road_lights2 <= 3'b100;
                        train_lights1 <= 3'b010;
                        train_lights1 <= 3'b010;
                        crossing_signal <= 2'b00;
                    end
                
                    state5:
                    begin
                        road_lights1 <= 3'b110;
                        road_lights2 <= 3'b110;
                        train_lights1 <= 3'b100;
                        train_lights1 <= 3'b100;
                        crossing_signal <= 2'b00;
                    end
                    default:
                    begin
                        road_lights1 <= 3'b001;
                        road_lights2 <= 3'b001;
                        train_lights1 <= 3'b100;
                        train_lights1 <= 3'b100;
                        crossing_signals <= 2'b11;
                    end
                endcase
            end
		end                  
endmodule
