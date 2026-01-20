/**
 * Type declarations for React Native Codegen types.
 * This augments the module for TypeScript compatibility in RN 0.78.x
 * where the .d.ts file is named CodegenTypesNamespace.d.ts
 */
/* eslint-disable @typescript-eslint/no-unused-vars */
declare module 'react-native/Libraries/Types/CodegenTypes' {
  import type { NativeSyntheticEvent } from 'react-native';

  export type BubblingEventHandler<
    T,
    PaperName extends string | never = never,
  > = (event: NativeSyntheticEvent<T>) => void | Promise<void>;

  export type DirectEventHandler<
    T,
    PaperName extends string | never = never,
  > = (event: NativeSyntheticEvent<T>) => void | Promise<void>;

  export type Double = number;
  export type Float = number;
  export type Int32 = number;
  export type UnsafeObject = object;
  export type UnsafeMixed = unknown;

  type DefaultTypes = number | boolean | string | ReadonlyArray<string>;

  export type WithDefault<
    Type extends DefaultTypes,
    Value extends Type | string | undefined | null,
  > = Type | undefined | null;
}
