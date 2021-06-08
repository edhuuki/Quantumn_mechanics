classdef balmer
    properties
        m;
        n;
        l1;
        linf;
        lnum;
    end
    methods
        function self = balmer(b)
            if isfield(b,"l1")
                self.l1 = b.l1;
                self.lnum = self.l1*(1/4-1/9);
                self.linf = self.lnum*4;
            end
            
            if isfield(b,"linf")
                self.linf = b.linf;
                self.lnum = self.linf/4;
                self.l1 = self.lnum/(1/4-1/9);
            end
        end
        function l = l_mn(self,m,n)
            if m>=n
                fprintf("Check; n needs to be greator than m \n");
            else
                l = self.lnum/(1/m^2-1/n^2);
            end
        end
    end
end
