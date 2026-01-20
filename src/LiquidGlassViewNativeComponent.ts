import {
  codegenNativeComponent,
  type ViewProps,
  type ColorValue,
  type CodegenTypes,
} from 'react-native';
import type { BubblingEventHandler } from 'react-native/Libraries/Types/CodegenTypes';

export interface NativeProps extends ViewProps {
  /**
   * Make the view respond to user interactions.
   * Interactive view grow on touch and show a shimmer effect.
   *
   * Defaults to `false`.
   */
  interactive?: boolean;
  /**
   * The variant of the liquid glass material.
   * You can toggle between 'clear', 'regular', and 'none' to materialize the glass.
   *
   * Defaults to 'regular'.
   */
  effect?: CodegenTypes.WithDefault<'clear' | 'regular' | 'none', 'regular'>;
  /**
   * The color of the glass effect.
   *
   * Defaults to `transparent`.
   */
  tintColor?: ColorValue;
  /**
   * The color scheme of the glass effect.
   * The effect appears dark or light based on the color scheme.
   *
   * Defaults to 'system'.
   */
  colorScheme?: CodegenTypes.WithDefault<'light' | 'dark' | 'system', 'system'>;
  /**
   * Called when the view is pressed.
   */
  onPress?: BubblingEventHandler<{}>;
}

export default codegenNativeComponent<NativeProps>('LiquidGlassView');
