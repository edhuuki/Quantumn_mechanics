classdef quantization
    properties
        en = 8.85419e-12;
        me = 9.109384e-31;
        mp = 1.6726219e-27;
        h = 6.6261e-34;
        hb = 6.6261e-34/(2*pi);
        ec = 1.602177e-19;
        nc;
        ab;
        e1;
        c = 3e8;
    end
    methods
        function self = quantization(Z)
            self.nc = Z*self.ec;
            self.ab = 4*pi*self.en*self.hb^2/(self.me*self.ec*self.nc);
            self.e1 = -self.ec^4*self.me/(8*self.h^2*self.en^2)*Z^2;
        end
        
        function e = e_n(self,n)
            e = self.e1/n^2;
        end
        
        function e = ev_n(self,n)
            e = self.e1/n^2;
            e = e/self.ec;
        end
        
        function de = dev_dn(self,n1,n2)
            de = self.ev_n(n1)-self.ev_n(n2);
        end
        
        function l = ev_l(self,ev)
            l = self.c*self.h/(ev*self.ec);
        end
        
        function l = l_ev(self,ev)
            l = self.ev_l(ev);
        end
        function r = Hr_ev(self,ev)
            n = round(sqrt(self.e1/ev/self.ec));
            v = sqrt(2*ev*self.ec/self.me);
            r = n*self.hb/(self.me*v);
        end
        function r = r_n(self,n)
            r = self.ab*n^2;
        end
        
        function n = n_ev(self,ev)
            n = sqrt(round(self.e1/self.ec/ev));
        end
        function v = ve_ab(self,ab)
            v = self.hb*2/(self.me*ab);
        end
        
        function v = ve_l(self,l)
            v = self.h/(self.me*l);
        end
        
        function v = vp_l(self,l)
            v = self.h/(1.6726219e-27*l);
        end
        
        
    end
end