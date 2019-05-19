function [ powdb, freq ] = periodogrambat( signal, Lm, rate )
%signal; Lm: L in bartlett method, rate frequency unit;
				starts = [ 0 : Lm : length( signal ) - Lm ];
				ends = starts + Lm;

				segments = [];
				for i = 1:length(starts)
					segments(end+1,:) = signal(starts(i)+1:ends(i));
                end
                segments=segments';
                
				k = ( length( signal ) / Lm );
			
            ffse=fft(segments);
			period = ( abs(ffse).^2 ) / Lm;
			
			% average each of the k data segments
			pow = mean( period( 1:end, : ), 2 );

            powdb=20*log10(pow);
			% discretization frequency
			df = ( 1 * k * rate );
 
			freq =  [0:Lm-1]  .* df;

		end