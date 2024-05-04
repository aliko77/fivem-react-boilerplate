import React, { createContext, useState } from "react";
import { DataContextProps } from "../types/DataProviderTypes";

export const DataCtx = createContext<DataContextProps>({} as DataContextProps);

export const DataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  
  const value = {
    //
  };

  return <DataCtx.Provider value={value}>{children}</DataCtx.Provider>;
};
