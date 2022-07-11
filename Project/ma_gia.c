void main() {

    int soSinhVien = 0;
    printf("Nhap so sinh vien\n");
    scanf("%d", &soSinhVien);

    int *diem = AllocateArray(soSinhVien, sizeof(int));   // So nguyen 4 byte
    char[] *hoTen = AllocateArray(soSinhVien, sizeof(char) * 64);// Toi da 64 ky tu
    int *index = AllocateArray(soSinhVien, sizeof(int));

    createIncreaseNumber(index);

    for(int i = 0; i < soSinhVien; i++) {
        printf("Nhap thong tin cua sinh vien thu %d:\n", i +1);
        
        do {
            printf("\tHo ten: ");
            fgets(hoTen[i], 64, stdin);
            PrintNewLine();
        } while(strlen(hoTen[i]) < 1);

        diem[i] = promptValidNumber(0, 10, "Nhap diem: ");
    }

    BubbleSort(diem, size, index);

    PrintStudent(diem, size, hoTen, index);


}

Subprogram PrintNewLine() {
    printf("\n");
}

Subprogram PrintTab() {
    printf("\t");
}

Subprogram RemoveNewline(string) {
    for(int i = 0; i < strlen(string); i++) {
        char character = string[i];
        if(character == '\0') {
            break;
        }

        if(character == '\n') {
            string[i] = '\0';
        }

       
    }
}

Subprogram createIncreaseNumber(int * array, int max) {
    for(int i = 0; i < max; i++) {
        array[i] = i;
    }
}
Subprogram PrintStudent(int diem[], int size, char ten[][], int index[]) {
    printf("STT \t\t Ho Ten \t\t\t Diem\n");
    printf("------------------------------");
    for(int i = 0; i < size, i++) {
        int tmp = index[i];
        printf("%d \t\t %s\t\t\t %d\n", i + 1, ten[tmp], diem[i]);
    }
}

Subprogram promptValidNumber(min, max, prompt) {
    printf("%s", prompt);
    char * userInput = AllocateArray(1, 64);            // 1 phan tu 64 byte
    fgets(userInput, 4, stdin);                        // Toi da 64 ky tu
    
    if(strlen(userInput) < 1) {
        printf("Ban chua nhap du lieu\n");
        promptValidNumber(min, max, prompt);
    }

    int number = 0;

    for(int i = 0; i < strlen(userInput); i++) {
        char character = userInput[i];
        if(character < '0' || character > '9') {
            printf("Du lieu ban nhap khong hop le\n");
            promptValidNumber(min, max, prompt)
        }

        number = number*10 + (character - '0');
    }

    if(number < min || number > max) {
        printf("So ban nhap phai nam trong khoang tu %d den %d\n", min, max);
        promptValidNumber(min, max, prompt)
    }
    
    return number;


}

Subprogram BubbleSort(int data[], int size, int index[]) {
    for(int i = 0; i < (size - 1); i ++) {
        for(int j = 0; j < (size - 1) - i; j++) {
            if(data[j] > data[j + 1]) {
                swap(data, j, j + 1);
                swap(index, j, j + 1);
            }
        }
    }
}
Subprogram swap(int data[], i, j) {
    int tmp = data[i];
    data[i] = data[j];
    data[j] = tmp;
}

Subprogram AllocateArray(count, size) {
    return (void *) calloc(count,  size);
}



