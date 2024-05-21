declare module 'react-hotkeys' {
    export interface HotKeysProps {
      keyMap?: Record<string, string | string[]>;
      handlers?: Record<string, (event?: KeyboardEvent | React.KeyboardEvent) => void>;
      root?: HTMLElement | (() => HTMLElement) | null;
      focused?: boolean;
      attach?: boolean;
      enableOnTags?: string[];
      allowChanges?: boolean;
      tabIndex?: number;
      className?: string;
      keyName?: string;
      handlersParent?: HTMLElement;
      innerRef?: React.RefObject<HTMLDivElement>;
      simulateMissingKeyPressEvents?: boolean;
      defaultKeyEventTimeout?: number;
      observedEvents?: string[];
      ignoreTags?: string[];
      onComponentMount?: () => void;
      onComponentUnmount?: () => void;
      onBeforeKeyDown?: (event: KeyboardEvent | React.KeyboardEvent) => boolean;
      onBeforeKeyUp?: (event: KeyboardEvent | React.KeyboardEvent) => boolean;
      onKeyPress?: (event: KeyboardEvent | React.KeyboardEvent) => void;
      onKeyUp?: (event: KeyboardEvent | React.KeyboardEvent) => void;
      onKeyDown?: (event: KeyboardEvent | React.KeyboardEvent) => void;
    }
  
    export class HotKeys extends React.Component<HotKeysProps> {}
  }
  