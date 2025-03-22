import { LightningElement, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

export default class FirePlatformEventButton extends NavigationMixin(LightningElement) {
    selectedRecordIds = [];

    handleRowSelection(event) {
        this.selectedRecordIds = event.detail.selectedRows.map(row => row.Id);
        console.log("🚀 Selected Record IDs:", JSON.stringify(this.selectedRecordIds));
    }

    openVFPage() {
        if (this.selectedRecordIds.length === 0) {
            console.error("⚠️ No records selected!");
            this.showToast("Error", "No records selected!", "error");
            return;
        }

        console.log("🔹 Opening VF Page with selected records:", JSON.stringify(this.selectedRecordIds));

        this[NavigationMixin.GenerateUrl]({
            type: "standard__webPage",
            attributes: {
                url: "/apex/FirePlatformEventVF"
            }
        }).then(vfUrl => {
            let vfWindow = window.open(vfUrl, "_blank");

            setTimeout(() => {
                if (vfWindow) {
                    console.log("✅ Sending records to VF Page:", JSON.stringify(this.selectedRecordIds));
                    vfWindow.postMessage(this.selectedRecordIds, "*");
                } else {
                    console.error("❌ Failed to open VF window.");
                }
            }, 2000);
        });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}
