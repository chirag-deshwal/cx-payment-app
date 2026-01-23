### User Request
Add a "Deposit" feature that shows a specific QR code image for users to scan and pay the company.

### Implementation Details
1.  **Assets**:
    *   Created `assets/images/deposit_qr.png` using the uploaded image.
    *   Updated `pubspec.yaml` to include `assets/images/`.

2.  **UI Components**:
    *   **DepositModal** (`lib/widgets/deposit_modal.dart`): A new Bottom Sheet widget that displays the QR code in a clean, dark-themed UI. Includes a "Done" button.

3.  **Dashboard Integration**:
    *   Modified `lib/dashboard_screen.dart` to include a "Deposit" button in the Balance section.
    *   The button opens the `DepositModal`.
    *   Updated `_buildBalanceSection` to accept `BuildContext` for navigation.

### Files Modified/Created
*   `pubspec.yaml` - Register assets.
*   `lib/widgets/deposit_modal.dart` - New widget.
*   `lib/dashboard_screen.dart` - Added button and logic.
