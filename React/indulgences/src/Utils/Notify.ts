import { Notyf } from "notyf";

class Notify {
    private notyf = new Notyf({
        duration: 3000,
        position: { x: "center", y: "top" },
        dismissible: true,
        types: [
            {
                type: 'success',
                background: '#4CAF50', // Green
                icon: false,
            },
            {
                type: 'error',
                background: '#F44336', // Red
                icon: false,
            },
            {
                type: 'warning',
                background: '#FF9800', // Orange
                icon: false,
            },
        ],
    });

    public success(message: string): void {
        this.notyf.success(message);
    }

    public error(message: string): void {
        this.notyf.error(message);
    }

    public warning(message: string): void {
        this.notyf.open({
            type: 'warning',
            message: message,
        });
    }
}

export const notify = new Notify();