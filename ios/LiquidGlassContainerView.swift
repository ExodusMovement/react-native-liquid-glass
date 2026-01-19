import UIKit

#if compiler(>=6.2)

@available(iOS 26.0, tvOS 26.0, *)
@objc public class LiquidGlassContainerViewImpl: UIVisualEffectView {
  @objc public var spacing: CGFloat = 0 {
    didSet {
      setupView()
    }
  }
  
  public override func layoutSubviews() {
    setupView()
  }
  
  private func setupView() {
    let effect = UIGlassContainerEffect()
    effect.spacing = spacing
    self.effect = effect
  }
}

#else

@objc public class LiquidGlassContainerViewImpl: UIView {}

#endif
