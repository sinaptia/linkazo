import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["primaryPicker", "primaryText", "secondaryPicker", "secondaryText"]

  connect() {
    this.syncColorFields()
  }

  syncColorFields() {
    // Sync primary color picker with text input
    this.primaryPickerTarget.addEventListener('input', () => {
      this.primaryTextTarget.value = this.primaryPickerTarget.value.toUpperCase()
    })

    this.primaryTextTarget.addEventListener('input', () => {
      const value = this.primaryTextTarget.value.trim()
      if (this.isValidHexColor(value)) {
        this.primaryPickerTarget.value = value
      }
    })

    // Sync secondary color picker with text input
    this.secondaryPickerTarget.addEventListener('input', () => {
      this.secondaryTextTarget.value = this.secondaryPickerTarget.value.toUpperCase()
    })

    this.secondaryTextTarget.addEventListener('input', () => {
      const value = this.secondaryTextTarget.value.trim()
      if (this.isValidHexColor(value)) {
        this.secondaryPickerTarget.value = value
      }
    })
  }

  isValidHexColor(color) {
    return /^#[0-9A-Fa-f]{6}$/.test(color)
  }
}