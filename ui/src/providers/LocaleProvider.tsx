import { createContext, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { LocaleContextProps, LocaleProps } from "../types/LocaleProviderTypes";

export const LocaleCtx = createContext<LocaleContextProps>(
  {} as LocaleContextProps
);

export const LocaleProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [locale, setLocale] = useState<LocaleProps>({} as LocaleProps);

  useNuiEvent("ui:setLocale", async (data: LocaleProps) => setLocale(data));

  const value = {
    locale,
    setLocale,
  };

  return <LocaleCtx.Provider value={value}>{children}</LocaleCtx.Provider>;
};

export default LocaleProvider;
