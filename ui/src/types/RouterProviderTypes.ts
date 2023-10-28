export type PageTypes = "home";

export type RouterProviderProps = {
  router: PageTypes;
  setRouter: (router: PageTypes) => void;
  page: React.ReactNode;
};
