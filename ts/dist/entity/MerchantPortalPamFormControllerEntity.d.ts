import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamFormController, MerchantPortalPamFormControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamFormControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamFormController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamFormControllerEntity): MerchantPortalPamFormControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamFormControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamFormControllerEntity>;
}
export { MerchantPortalPamFormControllerEntity };
