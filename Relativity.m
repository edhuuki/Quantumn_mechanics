
classdef Relativity
    properties
        beta;
        gama;%lorentz factor
        
        v;%Relative velocity
        
        t;%Moving frame of reference
        tp;%Intertial observer frame
        
        theta; %intermediate value that simplifies calculations
        c = 299792458;
        
        p;
        
    end
    
    methods
        function self = Relativity(s)
            if isfield(s,"t")&&isfield(s,"tp")
                self.t = s.t;
                self.tp = s.tp;
                self.gama = s.tp/s.t;
                self.theta = acsc(self.gama);
                self.beta = cos(acsc(self.gama));
                self.v = self.beta*self.c;
                
            end
            if isfield(s,"v")
                self.v = s.v;
                self.beta = s.v/self.c;
                self.theta = acos(self.beta);
                self.gama = csc(self.theta);
            end
            
            if isfield(s,"gama")
                self.gama = s.gama;
                self.theta = acsc(s.gama);
                self.beta = cos(self.theta);
                self.v = self.beta*self.c;
            end
            if isfield(s,"beta")
                self.beta = s.beta;
                self.v = s.beta*self.c;
                self.theta = acos(s.beta);
                self.gama = csc(self.theta);
                
                if isfield(s,"t")
                    self.t = s.t;
                    self.tp = self.gama*s.t;
                end
            end
        end
        
        function b = tp_t(self,t)
            b = self.gama*t;
        end
        function b = t_tp(self,tp)
            b = tp/self.gama;
        end
        function p = getP(self)
            p = self.gama*self.beta;
            fprintf("p = %g mc\n",p);
        end
        function ke = getKe(self,m)
            ke = m*self.c^2*(self.gama-1);
        end
    end
end