package ufpe.br.feature;

import ufpe.br.util.Util;

public aspect QuoteDynamic {
	
	Object around() : adviceexecution() && within(ufpe.br.feature.Quote){
		Object ret = null;		
		if (Driver.isActivated("quote")){
			ret = proceed();
		}
		else{
			try {
				ret = Util.proceedAroundCall(thisJoinPoint);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}